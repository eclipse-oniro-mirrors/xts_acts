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

import wifi from '@ohos.wifi';
import wifiext from '@ohos.wifiext';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

export default function wifiCoverageTest() {
  describe('wifiCoverageTest', () => {
    beforeAll(async (done) => {
      console.info('beforeAll case');
      done();
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(async (done) => {
      console.info('AfterAll case');
      done();
    })

    /**
     * @tc.name   Sub_Communication_WiFi_AddUntrustedConfig_HiddenSsid_True_001
     * @tc.number Sub_Communication_WiFi_AddUntrustedConfig_HiddenSsid_True_001
     * @tc.desc   Test addUntrustedConfig API with isHiddenSsid true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_AddUntrustedConfig_HiddenSsid_True_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_AddUntrustedConfig_HiddenSsid_True_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          ssid: "TestHidden",
          bssid: "00:11:22:33:44:55",
          preSharedKey: "12345678",
          isHiddenSsid: true,
          securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          creatorUid: 0,
          disableReason: 0,
          netId: 0,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          ipType: 0,
          staticIp: {
            ipAddress: 0,
            gateway: 0,
            dnsServers: [],
            domains: []
          }
        }
        let result = await wifi.addUntrustedConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_INVALID_001
     * @tc.number Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_INVALID_001
     * @tc.desc   Test addUntrustedConfig API with WIFI_SEC_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_INVALID_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_INVALID_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          ssid: "TestInvalid",
          bssid: "00:11:22:33:44:55",
          preSharedKey: "",
          isHiddenSsid: false,
          securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_INVALID,
          creatorUid: 0,
          disableReason: 0,
          netId: 0,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          ipType: 0,
          staticIp: {
            ipAddress: 0,
            gateway: 0,
            dnsServers: [],
            domains: []
          }
        }
        let result = await wifi.addUntrustedConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_OPEN_001
     * @tc.number Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_OPEN_001
     * @tc.desc   Test addUntrustedConfig API with WIFI_SEC_TYPE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_OPEN_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_OPEN_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          ssid: "TestOpen",
          bssid: "00:11:22:33:44:55",
          preSharedKey: "",
          isHiddenSsid: false,
          securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
          creatorUid: 0,
          disableReason: 0,
          netId: 0,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          ipType: 0,
          staticIp: {
            ipAddress: 0,
            gateway: 0,
            dnsServers: [],
            domains: []
          }
        }
        let result = await wifi.addUntrustedConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_WEP_001
     * @tc.number Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_WEP_001
     * @tc.desc   Test addUntrustedConfig API with WIFI_SEC_TYPE_WEP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_WEP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_WEP_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          ssid: "TestTestWEP",
          bssid: "00:11:22:33:44:55",
          preSharedKey: "12345678",
          isHiddenSsid: false,
          securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_WEP,
          creatorUid: 0,
          disableReason: 0,
          netId: 0,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          ipType: 0,
          staticIp: {
            ipAddress: 0,
            gateway: 0,
            dnsServers: [],
            domains: []
          }
        }
        let result = await wifi.addUntrustedConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_SAE_001
     * @tc.number Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_SAE_001
     * @tc.desc   Test addUntrustedConfig API with WIFI_SEC_TYPE_SAE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_SAE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_AddUntrustedConfig_SecurityType_SAE_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          ssid: "TestSAE",
          bssid: "00:11:22:33:44:55",
          preSharedKey: "12345678",
          isHiddenSsid: false,
          securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_SAE,
          creatorUid: 0,
          disableReason: 0,
          netId: 0,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          ipType: 0,
          staticIp: {
            ipAddress: 0,
            gateway: 0,
            dnsServers: [],
            domains: []
          }
        }
        let result = await wifi.addUntrustedConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.name   Sub_Communication_WiFi_RemoveUntrustedConfig_HiddenSsid_True_001
     * @tc.number Sub_Communication_WiFi_RemoveUntrustedConfig_HiddenSsid_True_001
     * @tc.desc   Test removeUntrustedConfig API with isHiddenSsid true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_RemoveUntrustedConfig_HiddenSsid_True_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_RemoveUntrustedConfig_HiddenSsid_True_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          ssid: "TestHiddenRemove",
          bssid: "00:11:22:33:44:55",
          preSharedKey: "12345678",
          isHiddenSsid: true,
          securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          creatorUid: 0,
          disableReason: 0,
          netId: 0,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          ipType: 0,
          staticIp: {
            ipAddress: 0,
            gateway: 0,
            dnsServers: [],
            domains: []
          }
        }
        let result = await wifi.removeUntrustedConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_INVALID_001
     * @tc.number Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_INVALID_001
     * @tc.desc   Test removeUntrustedConfig API with WIFI_SEC_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_INVALID_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_INVALID_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          ssid: "TestInvalidRemove",
          bssid: "00:11:22:33:44:55",
          preSharedKey: "",
          isHiddenSsid: false,
          securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_INVALID,
          creatorUid: 0,
          disableReason: 0,
          netId: 0,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          ipType: 0,
          staticIp: {
            ipAddress: 0,
            gateway: 0,
            dnsServers: [],
            domains: []
          }
        }
        let result = await wifi.removeUntrustedConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_OPEN_001
     * @tc.number Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_OPEN_001
     * @tc.desc   Test removeUntrustedConfig API with WIFI_SEC_TYPE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_OPEN_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_OPEN_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          ssid: "TestOpenRemove",
          bssid: "00:11:22:33:44:55",
          preSharedKey: "",
          isHiddenSsid: false,
          securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
          creatorUid: 0,
          disableReason: 0,
          netId: 0,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          ipType: 0,
          staticIp: {
            ipAddress: 0,
            gateway: 0,
            dnsServers: [],
            domains: []
          }
        }
        let result = await wifi.removeUntrustedConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_WEP_001
     * @tc.number Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_WEP_001
     * @tc.desc   Test removeUntrustedConfig API with WIFI_SEC_TYPE_WEP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_WEP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_WEP_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          ssid: "TestWEPRemove",
          bssid: "00:11:22:33:44:55",
          preSharedKey: "12345678",
          isHiddenSsid: false,
          securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_WEP,
          creatorUid: 0,
          disableReason: 0,
          netId: 0,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          ipType: 0,
          staticIp: {
            ipAddress: 0,
            gateway: 0,
            dnsServers: [],
            domains: []
          }
        }
        let result = await wifi.removeUntrustedConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_SAE_001
     * @tc.number Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_SAE_001
     * @tc.desc   Test removeUntrustedConfig API with WIFI_SEC_TYPE_SAE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_SAE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_RemoveUntrustedConfig_SecurityType_SAE_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          ssid: "TestSAERemove",
          bssid: "00:11:22:33:44:55",
          preSharedKey: "12345678",
          isHiddenSsid: false,
          securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_SAE,
          creatorUid: 0,
          disableReason: 0,
          netId: 0,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          ipType: 0,
          staticIp: {
            ipAddress: 0,
            gateway: 0,
            dnsServers: [],
            domains: []
          }
        }
        let result = await wifi.removeUntrustedConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.name   Sub_Communication_WiFiExt_SetPowerModel_Sleeping_001
     * @tc.number Sub_Communication_WiFiExt_SetPowerModel_Sleeping_001
     * @tc.desc   Test wifiext.setPowerModel API with SLEEPING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiExt_SetPowerModel_Sleeping_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFiExt_SetPowerModel_Sleeping_001';
      console.info(`${caseName} test start`);
      try {
        let result = wifiext.setPowerModel(wifiext.PowerModel.SLEEPING);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiExt_SetPowerModel_General_001
     * @tc.number Sub_Communication_WiFiExt_SetPowerModel_General_001
     * @tc.desc   Test wifiext.setPowerModel API with GENERAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiExt_SetPowerModel_General_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFiExt_SetPowerModel_General_001';
      console.info(`${caseName} test start`);
      try {
        let result = wifiext.setPowerModel(wifiext.PowerModel.GENERAL);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiExt_SetPowerModel_ThroughWall_001
     * @tc.number Sub_Communication_WiFiExt_SetPowerModel_ThroughWall_001
     * @tc.desc   Test wifiext.setPowerModel API with THROUGH_WALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiExt_SetPowerModel_ThroughWall_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFiExt_SetPowerModel_ThroughWall_001';
      console.info(`${caseName} test start`);
      try {
        let result = wifiext.setPowerModel(wifiext.PowerModel.THROUGH_WALL);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_CreateGroup_GoBand_AUTO_001
     * @tc.number Sub_Communication_WiFi_CreateGroup_GoBand_AUTO_001
     * @tc.desc   Test createGroup API with GO_BAND_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level 2
     */
    it('Sub_Communication_WiFi_CreateGroup_GoBand_AUTO_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_CreateGroup_GoBand_AUTO_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestGroup",
          goBand: wifi.GroupOwnerBand.GO_BAND_AUTO
        }
        let result = wifi.createGroup(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_CreateGroup_GoBand_5GHZ_001
     * @tc.number Sub_Communication_WiFi_CreateGroup_GoBand_5GHZ_001
     * @tc.desc   Test createGroup API with GO_BAND_5GHZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_CreateGroup_GoBand_5GHZ_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_CreateGroup_GoBand_5GHZ_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestGroup5G",
          goBand: wifi.GroupOwnerBand.GO_BAND_5GHZ
        }
        let result = wifi.createGroup(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });



    /**
     * @tc.name   Sub_Communication_WiFi_P2pConnect_DeviceAddress_Empty_001
     * @tc.number Sub_Communication_WiFi_P2pConnect_DeviceAddress_Empty_001
     * @tc.desc   Test p2pConnect API with empty deviceAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_P2pConnect_DeviceAddress_Empty_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_P2pConnect_DeviceAddress_Empty_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          deviceAddress: "",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2p",
          goBand: wifi.GroupOwnerBand.GO_BAND_AUTO
        }
        let result = wifi.p2pConnect(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_P2pConnect_Passphrase_Empty_001
     * @tc.number Sub_Communication_WiFi_P2pConnect_Passphrase_Empty_001
     * @tc.desc   Test p2pConnect API with empty passphrase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_P2pConnect_Passphrase_Empty_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_P2pConnect_Passphrase_Empty_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "",
          groupName: "TestP2pEmpty",
          goBand: wifi.GroupOwnerBand.GO_BAND_AUTO
        }
        let result = wifi.p2pConnect(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_P2pConnect_GroupName_Empty_001
     * @tc.number Sub_Communication_WiFi_P2pConnect_GroupName_Empty_001
     * @tc.desc   Test p2pConnect API with empty groupName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_P2pConnect_GroupName_Empty_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_P2pConnect_GroupName_Empty_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "",
          goBand: wifi.GroupOwnerBand.GO_BAND_AUTO
        }
        let result = wifi.p2pConnect(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_P2pConnect_GoBand_AUTO_001
     * @tc.number Sub_Communication_WiFi_P2pConnect_GoBand_AUTO_001
     * @tc.desc   Test p2pConnect API with GO_BAND_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_P2pConnect_GoBand_AUTO_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_P2pConnect_GoBand_AUTO_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2pAuto",
          goBand: wifi.GroupOwnerBand.GO_BAND_AUTO
        }
        let result = wifi.p2pConnect(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFi_P2pConnect_GoBand_5GHZ_001
     * @tc.number Sub_Communication_WiFi_P2pConnect_GoBand_5GHZ_001
     * @tc.desc   Test p2pConnect API with GO_BAND_5GHZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_P2pConnect_GoBand_5GHZ_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_P2pConnect_GoBand_5GHZ_001';
      console.info(`${caseName} test start`);
      try {
        let config = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2p5G",
          goBand: wifi.GroupOwnerBand.GO_BAND_5GHZ
        }
        let result = wifi.p2pConnect(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'boolean').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name   Sub_Communication_WiFi_P2pDeviceStatus_Enums
     * @tc.number Sub_Communication_WiFi_P2pDeviceStatus_Enums
     * @tc.desc   Test P2pDeviceStatus Enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_P2pDeviceStatus_Enums', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let caseName = 'Sub_Communication_WiFi_P2pDeviceStatus_Enums';
      console.info(`${caseName} test start`);
      expect(wifi.P2pDeviceStatus.CONNECTED === 0).assertTrue();
      expect(wifi.P2pDeviceStatus.INVITED === 1).assertTrue();
      expect(wifi.P2pDeviceStatus.FAILED === 2).assertTrue();
      expect(wifi.P2pDeviceStatus.AVAILABLE === 3).assertTrue();
      expect(wifi.P2pDeviceStatus.UNAVAILABLE === 4).assertTrue();
      console.info(`${caseName} test end`);
      done();
    });

  })
}
