/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

import wifi from '@ohos.wifi'
import wifiMg from '@ohos.wifiManager'
import osaccount from '@ohos.account.osAccount'
import bundle from '@ohos.bundle'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'

async function applyPermission() {
    let osAccountManager = osaccount.getAccountManager();
    console.info("=== getAccountManager finish");
    let localId = await osAccountManager.getOsAccountLocalIdFromProcess();
    console.info("LocalId is :" + localId);
    let appInfo = await bundle.getApplicationInfo('ohos.acts.communication.wifi.wifidevice', 0, localId);
    let atManager = abilityAccessCtrl.createAtManager();
    if (atManager != null) {
        let tokenID = appInfo.accessTokenId;
        console.info('[permission] case accessTokenID is ' + tokenID);
        let permissionName1 = 'ohos.permission.LOCATION';
        await atManager.grantUserGrantedPermission(tokenID, permissionName1, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
        });
    } else {
        console.info('[permission] case apply permission failed, createAtManager failed');
    }
}

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

function checkWifiPowerOn(){
    console.info("[wifi_test]wifi status:" + wifiMg.isWifiActive());
}
function resolveIP(ip) {
    return (ip>>24 & 0xFF) + "." + (ip>>16 & 0xFF) + "." + (ip>>8 & 0xFF) + "." + (ip & 0xFF);
}

export default function actsWifiErrorCode202Test() {
    describe('actsWifiErrorCode202Test', function() {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await applyPermission();
            done();
        })

        beforeEach(function () {
            checkWifiPowerOn();
        })
        afterEach(function () {
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0077
        * @tc.name testEnableWifi
        * @tc.desc Test enableWifi API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0077', 0, async function (done) {
            try {
                let enable = wifiMg.enableWifi();
                await sleep(3000);
            } catch (error) {
                console.error(`enableWifi failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0078
        * @tc.name testDisableWifi
        * @tc.desc Test disableWifi API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0078', 0, async function (done) {
            try {
                let disable = wifiMg.disableWifi();
                await sleep(3000);
            } catch (error) {
                console.error(`disableWifi failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0079
        * @tc.name testAddDeviceConfig
        * @tc.desc Test addDeviceConfig API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0079', 0, async function (done) {
            (async () => {
                try {
                    let wifiDeviceConfig = {
                        "ssid": "TEST_OPEN",
                        "bssid": "22:9b:e6:48:1f:5c",
                        "preSharedKey": "",
                        "isHiddenSsid": false,
                        "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
                        "netId": -1,
                        "ipType": wifiMg.IpType.DHCP,
                        "creatorUid": 7,
                        "disableReason": 0,
                        "randomMacType": 0,
                        "randomMacAddr": "11:22:33:44:55:66",
                        "staticIp": {"ipAddress": 1284752956,"gateway": 1284752936},
                    };
                    let result = await wifiMg.addDeviceConfig(wifiDeviceConfig);
                    console.info("[wifi_test] addDeviceConfig  promise successful :" + JSON.stringify(result));
                } catch(error) {
                    console.error(`addDeviceConfig promise failed, code is ${error.code}, message is ${error.message}`);
                    expect(error.code).assertEqual("202")
                }
            })();
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0080
        * @tc.name testConnectToNetwork
        * @tc.desc Test connectToNetwork API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0080', 0, async function (done) {
            try {
                let connectToNetwork = wifiMg.connectToNetwork(0);
            } catch (error) {
                console.error(`connectToNetwork failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0081
        * @tc.name testConnectToDevice
        * @tc.desc Test connectToDevice API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0081', 0, async function (done) {
            try {
                let wifiDeviceConfig = {
                    "ssid": "TEST_OPEN",
                    "bssid": "22:9b:e6:48:1f:5c",
                    "preSharedKey": "",
                    "isHiddenSsid": false,
                    "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
                    "netId": -1,
                    "ipType": wifiMg.IpType.DHCP,
                    "creatorUid": 7,
                    "disableReason": 0,
                    "randomMacType": 0,
                    "randomMacAddr": "11:22:33:44:55:66",
                    "staticIp": {"ipAddress": 1284752956,"gateway": 1284752936},
                };
                let connectToDevice = wifiMg.connectToDevice(wifiDeviceConfig);
            } catch (error) {
                console.error(`connectToDevice failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0082
        * @tc.name testDisconnect
        * @tc.desc Test disconnect API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0082', 0, async function (done) {
            try {
                let disconnect = wifiMg.disconnect();
            } catch (error) {
                console.error(`disconnect failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0083
        * @tc.name testGetSupportedFeatures
        * @tc.desc Test getSupportedFeatures API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0083', 0, async function (done) {
            try {
                let getSupportedFeatures = wifiMg.getSupportedFeatures();
            } catch (error) {
                console.error(`getSupportedFeatures failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0084
        * @tc.name testGetDeviceMacAddress
        * @tc.desc Test getDeviceMacAddress API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0084', 0, async function (done) {
            try {
                let getDeviceMacAddress = wifiMg.getDeviceMacAddress();
            } catch (error) {
                console.error(`getDeviceMacAddress failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0085
        * @tc.name testReassociate
        * @tc.desc Test reassociate API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0085', 0, async function (done) {
            try {
                let reassociate = wifiMg.reassociate();
            } catch (error) {
                console.error(`reassociate failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0086
        * @tc.name testReconnect
        * @tc.desc Test reconnect API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0086', 0, async function (done) {
            try {
                let reconnect = wifiMg.reconnect();
            } catch (error) {
                console.error(`reconnect failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0087
        * @tc.name testGetDeviceConfigs
        * @tc.desc Test getDeviceConfigs API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0087', 0, async function (done) {
            try {
                let getDeviceConfigs = wifiMg.getDeviceConfigs();
            } catch (error) {
                console.error(`getDeviceConfigs failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0088
        * @tc.name testUpdateNetwork
        * @tc.desc Test updateNetwork API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0088', 0, async function (done) {
            try {
                let wifiDeviceConfig = {
                    "ssid": "TEST_OPEN",
                    "bssid": "22:9b:e6:48:1f:5c",
                    "preSharedKey": "",
                    "isHiddenSsid": false,
                    "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
                    "netId": -1,
                    "ipType": wifiMg.IpType.DHCP,
                    "creatorUid": 7,
                    "disableReason": 0,
                    "randomMacType": 0,
                    "randomMacAddr": "11:22:33:44:55:66",
                    "staticIp": {"ipAddress": 1284752956,"gateway": 1284752936},
                };
                let updateNetwork = wifiMg.updateNetwork(wifiDeviceConfig);
            } catch (error) {
                console.error(`updateNetwork failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0089
        * @tc.name testDisableNetwork
        * @tc.desc Test disableNetwork API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0089', 0, async function (done) {
            try {
                let disableDeviceConfig = wifiMg.disableDeviceConfig(0);
            } catch (error) {
                console.error(`disableDeviceConfig failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0090
        * @tc.name testRemoveAllNetwork
        * @tc.desc Test removeAllNetwork API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0090', 0, async function (done) {
            try {
                let removeAllNetwork = wifiMg.removeAllNetwork();
            } catch (error) {
                console.error(`removeAllNetwork failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0091
        * @tc.name testRemoveDevice
        * @tc.desc Test removeDevice API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0091', 0, async function (done) {
            try {
                let removeDeviceConfig = wifiMg.removeDeviceConfig(0);
            } catch (error) {
                console.error(`removeDeviceConfig failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0092
        * @tc.name testEnableHotspot
        * @tc.desc Test enableHotspot API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0092', 0, async function (done) {
            try {
                let enableHotspot = wifiMg.enableHotspot();
            } catch (error) {
                console.error(`enableHotspot failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0093
        * @tc.name testDisableHotspot
        * @tc.desc Test disableHotspot API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0093', 0, async function (done) {
            try {
                let disableHotspot = wifiMg.disableHotspot();
            } catch (error) {
                console.error(`disableHotspot failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0094
        * @tc.name testIsHotspotDualBandSupported
        * @tc.desc Test isHotspotDualBandSupported API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0094', 0, async function (done) {
            try {
                let isHotspotDualBandSupported = wifiMg.isHotspotDualBandSupported();
            } catch (error) {
                console.error(`isHotspotDualBand failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0095
        * @tc.name testIsHotspotActive
        * @tc.desc Test isHotspotActive API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0095', 0, async function (done) {
            try {
                let isHotspotActive = wifiMg.isHotspotActive();
            } catch (error) {
                console.error(`isHotspotActive failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0096
        * @tc.name testSetHotspotConfig
        * @tc.desc Test setHotspotConfig API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0096', 0, async function (done) {
            try {
                let hotSpotConfig = {
                    "ssid": "test202",
                    "band": 1,
                    "preSharedKey": "12345678",
                    "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                    "maxConn": 8,
                };
                let setHotspotConfig = wifiMg.setHotspotConfig(hotSpotConfig);
            } catch (error) {
                console.error(`setHotspotConfig failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0097
        * @tc.name testGetHotspotConfig
        * @tc.desc Test getHotspotConfig API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0097', 0, async function (done) {
            try {
                let getHotspotConfig = wifiMg.getHotspotConfig();
            } catch (error) {
                console.error(`getHotspotConfig failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0098
        * @tc.name testGetStations
        * @tc.desc Test getStations API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0098', 0, async function (done) {
            try {
                let getStations = wifiMg.getStations();
            } catch (error) {
                console.error(`getStations failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0099
        * @tc.name testDeletePersistentP2pGroup
        * @tc.desc Test deletePersistentP2pGroup API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0099', 0, async function (done) {
            try {
                let deletePersistentP2pGroup = wifiMg.deletePersistentP2pGroup(0);
            } catch (error) {
                console.error(`deletePersistentP2pGroup failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0100
        * @tc.name testGetP2pGroups
        * @tc.desc Test getP2pGroups API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0100', 0, async function (done) {
            (async () => {
                try {
                    let getP2pGroups = await wifiMg.getP2pGroups();
                    console.info("[wifi_test] getP2pGroups  promise successful :" + JSON.stringify(result));
                } catch(error) {
                    console.error(`getP2pGroups promise failed, code is ${error.code}, message is ${error.message}`);
                    expect(error.code).assertEqual("202")
                }
            })();
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0101
        * @tc.name testGetP2pGroups
        * @tc.desc Test getP2pGroups API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0101', 0, async function (done) {
            try {
                wifiMg.getP2pGroups(
                    (error,data) => {
                        if (error) {
                            console.error(`getP2pGroups callback, code ${error.code}, message ${error.message}`);
                            expect(error.code).assertEqual("202")
                            return;
                        }
                        console.info("[wifi_test] getP2pGroups callback result: " + JSON.stringify(data));
                    });
            } catch (error) {
                console.error(`getP2pGroups failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0102
        * @tc.name testSetP2pDeviceName
        * @tc.desc Test setP2pDeviceName API ErrorCode 202.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0102', 0, async function (done) {
            try {
                let setDeviceName = wifiMg.setP2pDeviceName("1");
            } catch (error) {
                console.error(`setDeviceName failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("202")
            }
            done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}

