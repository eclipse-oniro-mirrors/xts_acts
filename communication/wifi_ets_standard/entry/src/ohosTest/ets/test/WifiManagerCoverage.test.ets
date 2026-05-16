/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
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

import { wifiManager } from '@kit.ConnectivityKit';
import { wifiManagerExt } from '@kit.ConnectivityKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

function sleep(delay:number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, delay);
  }); 
}

export default function wifiManagerCoverage() {

  describe('wifiManagerCoverage', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      done();
    })

    beforeEach(() => {
    })

    afterEach(() => {
    })

    afterAll(async (done: Function) => {
      console.info('AfterAll case');
      done();
    })

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_DeviceAddressType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_DeviceAddressType_RealDeviceAddress_001
     * @tc.desc   Test addDeviceConfig API with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_DeviceAddressType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_DeviceAddressType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestRealAddr",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_INVALID_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_INVALID_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_INVALID_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_INVALID_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestInvalidSec",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_EAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestEAP",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_SUITE_B_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_SUITE_B_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_EAP_SUITE_B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_SUITE_B_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_SUITE_B_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestEapSuiteB",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_TLS,
            phase2Method: wifiManager.Phase2Method.PHASE2_PAP,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_OWE_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_OWE_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_OWE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_OWE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_OWE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestOWE",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_CERT_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_CERT_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_WAPI_CERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_CERT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_CERT_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestWapiCert",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_PSK_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_PSK_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_WAPI_PSK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_PSK_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_PSK_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestWapiPsk",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_EapConfig_EmptyStrings_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_EapConfig_EmptyStrings_001
     * @tc.desc   Test addDeviceConfig API with empty EAP config strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_EapConfig_EmptyStrings_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_EapConfig_EmptyStrings_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestEapEmpty",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "",
            anonymousIdentity: "",
            password: "",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_WapiConfig_EmptyStrings_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_WapiConfig_EmptyStrings_001
     * @tc.desc   Test addDeviceConfig API with empty WAPI config strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_WapiConfig_EmptyStrings_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_WapiConfig_EmptyStrings_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestWapiEmpty",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_DeviceAddressType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_DeviceAddressType_RealDeviceAddress_001
     * @tc.desc   Test addCandidateConfig API with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_DeviceAddressType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_DeviceAddressType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandRealAddr",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_HiddenSsid_True_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_HiddenSsid_True_001
     * @tc.desc   Test addCandidateConfig API with isHiddenSsid true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_HiddenSsid_True_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_HiddenSsid_True_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandHidden",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: true,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_INVALID_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_INVALID_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_INVALID_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_INVALID_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandInvalid",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OPEN_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OPEN_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC_TYPE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OPEN_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OPEN_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandOpen",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WEP_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WEP_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WEP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WEP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWEP",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WEP,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_SAE_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_SAE_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_SAE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_SAE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandSAE",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_SAE,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandEAP",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_SUITE_B_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_SUITE_B_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_SUITE_B_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SubCommunication_WiFiManager_AddCandidateConfig_SecurityType_EAP_SUITE_B_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandEapSuiteB",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_TLS,
            phase2Method: wifiManager.Phase2Method.PHASE2_PAP,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OWE_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OWE_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OWE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OWE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandOWE",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_CERT_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_CERT_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_CERT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_CERT_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWapiCert",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_PSK_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_PSK_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_PSK_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_PSK_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWapiPsk",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_EapConfig_EmptyStrings_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_EapConfig_EmptyStrings_001
     * @tc.desc   Test addCandidateConfig API with empty EAP config strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_EapConfig_EmptyStrings_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_EapConfig_EmptyStrings_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandEapEmpty",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "",
            anonymousIdentity: "",
            password: "",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_WapiConfig_EmptyStrings_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_WapiConfig_EmptyStrings_001
     * @tc.desc   Test addCandidateConfig API with empty WAPI config strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_WapiConfig_EmptyStrings_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_WapiConfig_EmptyStrings_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWapiEmpty",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.name   Sub_Communication_WiFiManager_CreateGroup_DeviceAddressType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_CreateGroup_DeviceAddressType_RealDeviceAddress_001
     * @tc.desc   Test createGroup API with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_CreateGroup_DeviceAddressType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_CreateGroup_DeviceAddressType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestGroupReal",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.createGroup(config);
        console.log(`${caseName} get result success`);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_CreateGroup_GoBand_2GHZ_001
     * @tc.number Sub_Communication_WiFiManager_CreateGroup_GoBand_2GHZ_001
     * @tc.desc   Test createGroup API with GO_BAND_2GHZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_CreateGroup_GoBand_2GHZ_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_CreateGroup_GoBand_2GHZ_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestGroup2G",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_2GHZ
        }
        wifiManager.createGroup(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_CreateGroup_GoBand_5GHZ_001
     * @tc.number Sub_Communication_WiFiManager_CreateGroup_GoBand_5GHZ_001
     * @tc.desc   Test createGroup API with GO_BAND_5GHZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_CreateGroup_GoBand_5GHZ_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_CreateGroup_GoBand_5GHZ_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestGroup5G",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_5GHZ
        }
        wifiManager.createGroup(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_DeviceAddress_Empty_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_DeviceAddress_Empty_001
     * @tc.desc   Test p2pConnect API with empty deviceAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_DeviceAddress_Empty_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_DeviceAddress_Empty_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2pEmpty",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_DeviceAddressType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_DeviceAddressType_RealDeviceAddress_001
     * @tc.desc   Test p2pConnect API with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_DeviceAddressType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_DeviceAddressType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2pReal",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_Passphrase_Empty_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_Passphrase_Empty_001
     * @tc.desc   Test p2pConnect API with empty passphrase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_Passphrase_Empty_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_Passphrase_Empty_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "",
          groupName: "TestP2pEmptyPass",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_GroupName_Empty_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_GroupName_Empty_001
     * @tc.desc   Test p2pConnect API with empty groupName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_GroupName_Empty_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_GroupName_Empty_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_GoBand_AUTO_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_GoBand_AUTO_001
     * @tc.desc   Test p2pConnect API with GO_BAND_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_GoBand_AUTO_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_GoBand_AUTO_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2pAuto",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_GoBand_2GHZ_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_GoBand_2GHZ_001
     * @tc.desc   Test p2pConnect API with GO_BAND_2GHZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_GoBand_2GHZ_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_GoBand_2GHZ_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2p2G",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_2GHZ
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_GoBand_5GHZ_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_GoBand_5GHZ_001
     * @tc.desc   Test p2pConnect API with GO_BAND_5GHZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_GoBand_5GHZ_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_GoBand_5GHZ_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2p5G",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_5GHZ
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_BssidType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_BssidType_RealDeviceAddress_001
     * @tc.desc   Test addDeviceConfig API callback with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_BssidType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_BssidType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestRealAddrCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_INVALID_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_INVALID_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_INVALID_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_INVALID_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestInvalidSecCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_EAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestEAPCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_SUITE_B_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_SUITE_B_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_EAP_SUITE_B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_SUITE_B_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_SUITE_B_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestEapSuiteBCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_TLS,
            phase2Method: wifiManager.Phase2Method.PHASE2_PAP,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect(Number(err.code)).assertEqual(401);
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_OWE_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_OWE_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_OWE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_OWE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SubSub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_OWE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestOWECallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_CERT_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_CERT_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_WAPI_CERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_CERT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_CERT_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestWapiCertCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect(err.code).assertEqual(401);
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_PSK_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_PSK_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_WAPI_PSK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_PSK_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_PSK_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestWapiPskCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_BssidType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_BssidType_RealDeviceAddress_001
     * @tc.desc   Test addCandidateConfig API callback with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_BssidType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_BssidType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandRealAddrCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_HiddenSsid_True_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_HiddenSsid_True_001
     * @tc.desc   Test addCandidateConfig API callback with isHiddenSsid true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_HiddenSsid_True_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_HiddenSsid_True_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandHiddenCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: true,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_INVALID_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_INVALID_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_INVALID_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_INVALID_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandInvalidCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OPEN_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OPEN_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OPEN_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OPEN_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandOpenCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WEP_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WEP_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_WEP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WEP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WEP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWEPCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WEP,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect(Number(err.code)).assertEqual(401);
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_SAE_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_SAE_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_SAE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_SAE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_SAE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandSAECallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_SAE,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_EAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandEAPCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_SUITE_B_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_SUITE_B_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_EAP_SUITE_B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_SUITE_B_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_SUITE_B_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandEapSuiteBCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_TLS,
            phase2Method: wifiManager.Phase2Method.PHASE2_PAP,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect(Number(err.code)).assertEqual(401);
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OWE_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OWE_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_OWE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OWE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OWE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandOWECallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect(Number(err.code)).assertEqual(401);
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_CERT_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_CERT_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_WAPI_CERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_CERT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_CERT_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWapiCertCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect(Number(err.code)).assertEqual(401);
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_PSK_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_PSK_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_WAPI_PSK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_PSK_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_PSK_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWapiPskCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   Sub_Communication_WiFiManager_WifiWapiConfig_Properties_001
     * @tc.number Sub_Communication_WiFiManager_WifiWapiConfig_Properties_001
     * @tc.desc   Test WifiWapiConfig interface properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_WifiWapiConfig_Properties_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_WifiWapiConfig_Properties_001';
      console.info(`${caseName} test start`);
      try {
        let wapiConfig: wifiManager.WifiWapiConfig = {
          wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
          wapiAsCert: "testCert",
          wapiUserCert: "userCert"
        };
        console.log(`${caseName} create wapiConfig success `, wapiConfig);
        expect(typeof wapiConfig.wapiPskType).assertEqual('number');
        expect(typeof wapiConfig.wapiAsCert).assertEqual('string');
        expect(typeof wapiConfig.wapiUserCert).assertEqual('string');
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_WifiScanInfo_ExtendedProperties_001
     * @tc.number Sub_Communication_WiFiManager_WifiScanInfo_ExtendedProperties_001
     * @tc.desc   Test WifiScanInfo extended interface properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_WifiScanInfo_ExtendedProperties_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_WifiScanInfo_ExtendedProperties_001';
      console.info(`${caseName} test start`);
      try {
        let status = wifiManager.isWifiActive();
        console.info("isWifiActive result:" + status);
        if(!status) {
            console.info("wifi is close,enableWifi start.");
            wifiManager.enableWifi();
            await sleep(2000);
            let state1 = wifiManager.isWifiActive();
            console.info("isWifiActive result:" + state1);
            expect(state1).assertTrue();
            console.info("enableWifi success.");
        }
        let scanInfolist = wifiManager.getScanInfoList();
        if (scanInfolist.length > 0) {
          let scanInfo = scanInfolist[0];
          console.log(`${caseName} create scanInfo success `, JSON.stringify(scanInfo));
          expect(typeof scanInfo.bssidType).assertEqual('number');
          expect(typeof scanInfo.centerFrequency0).assertEqual('number');
          expect(typeof scanInfo.centerFrequency1).assertEqual('number');
          expect(Array.isArray(scanInfo.infoElems)).assertTrue();
          expect(typeof scanInfo.bssidType).assertEqual('number');
          expect(typeof scanInfo.supportedWifiCategory).assertEqual('number');
          expect(typeof scanInfo.isHiLinkNetwork).assertEqual('boolean');
        }else{
          //当环境内无wifi或者热点时，获取列表长度为0
          expect(scanInfolist.length === 0).assertTrue();
        }
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

  })
}
