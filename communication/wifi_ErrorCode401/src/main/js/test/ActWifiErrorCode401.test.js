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

export default function actsWifiErrorCode401Test() {
    describe('actsWifiErrorCode401Test', function() {
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
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0005
        * @tc.name testAddCandidateConfig
        * @tc.desc Test AddCandidateConfig API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0005', 0, async function (done) {
            (async () => {
                try {
                    let wifiDeviceConfig = {
                        "ssid": "TEST_PSK",
                        "bssid": "22:9b:e6:48:1f:5c",
                        "preSharedKey": "12345678",
                        "isHiddenSsid": false,
                        "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                    };
                    let result = await wifiMg.addCandidateConfig(wifiDeviceConfig)
                    console.info("[wifi_test] addCandidateConfig promise successful :" + JSON.stringify(result));
                } catch(error) {
                    console.error(`addCandidateConfig promise failed, code ${error.code}, message ${error.message}`);
                    expect(error.code).assertEqual("401")
                }
            })();
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0006
        * @tc.name testAddCandidateConfig
        * @tc.desc Test AddCandidateConfig API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0006', 0, async function (done) {
            try {
                let wifiDeviceConfig = {
                    "ssid": "TEST_PSK",
                    "bssid": "22:9b:e6:48:1f:5c",
                    "preSharedKey": "12345678",
                    "isHiddenSsid": false,
                    "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                };
                wifiMg.addCandidateConfig(wifiDeviceConfig,
                    (error,data) => {
                        if (error) {
                            console.error(`addCandidateConfig callback, code ${error.code}, message ${error.message}`);
                            expect(error.code).assertEqual("401")
                            return;
                        }
                        console.info("[wifi_test] addCandidateConfig callback result: " + JSON.stringify(data));
                    });
            } catch (error) {
                console.error(`addCandidateConfig failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0007
        * @tc.name testRemoveCandidateConfig
        * @tc.desc Test RemoveCandidateConfig API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0007', 0, async function(done) {
            (async () => {
                try {
                    let result = await wifiMg.removeCandidateConfig(null);
                    console.info("[wifi_test] removeCandidateConfig  promise successful ");
                } catch(error) {
                    console.error(`removeCandidate promise failed, code ${error.code}, message ${error.message}`);
                    expect(error.code).assertEqual("401")
                }
            })();
            let configs = wifiMg.getCandidateConfigs();
            console.info("[wifi_test] wifi getDeviceConfigs result : " + JSON.stringify(configs));
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0008
        * @tc.name testRemoveCandidateConfig
        * @tc.desc Test RemoveCandidateConfig API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0008', 0, async function(done) {
            try {
                wifiMg.removeCandidateConfig(null,
                    error => {
                        if (error) {
                            console.error(`removeCand callback, code ${error.code}, message ${error.message}`);
                            expect(error.code).assertEqual("401")
                            return;
                        }
                        console.info("[wifi_test] removeCandidateConfig callback successful" );
                    });
            } catch (error) {
                console.error(`removeCandidateConfig failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0009
        * @tc.name testConnectToCandidateConfig
        * @tc.desc Test ConnectToCandidateConfig API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0009', 0, async function(done) {
            try {
                wifiMg.connectToCandidateConfig("null");
                console.info("[wifi_test] connectToCandidateConfig successful " );
            } catch(error) {
                console.error(`connectToCandidateConfig failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0014
        * @tc.name testGetSignalLevel
        * @tc.desc Test GetSignalLevel API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0014', 0, async function(done) {
            try {
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel('abc','bcd'));
            } catch(error) {
                console.error(`getSignalLevel failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0017
        * @tc.name testIsFeatureSupported
        * @tc.desc Test isFeatureSupported API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0017', 0, async function(done) {
            try {
                let isSupport1 = wifiMg.isFeatureSupported('123');
                console.info("[wifi_test] isFeatureSupported -> " + isSupport1);
            } catch(error) {
                console.error(`isFeatureSupported failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0026
        * @tc.name testCreateGroup
        * @tc.desc Test createGroup API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0026', 0, async function (done) {
            try {
                let createGroup = wifiMg.createP2pGroup(null);
            } catch (error) {
                console.error(`createGroup failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0020
        * @tc.name testP2pConnect
        * @tc.desc Test p2pConnect API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0020', 0, async function(done) {
            try {
                let p2pConnectResult = wifiMg.p2pConnect(null);
            } catch(error) {
                console.error(`p2pConnect failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            let p2pCancelResult = wifiMg.p2pCancelConnect();
            await sleep(2000);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0027
        * @tc.name testWifiStateChange
        * @tc.desc Test wifiStateChange API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0027', 0, async function (done) {
            let wifiState = "wifiStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`wifiStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`wifiStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0028
        * @tc.name testWifiConnectionChange
        * @tc.desc Test wifiConnectionChange API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0028', 0, async function (done) {
            let wifiState = "wifiConnectionChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`wifiConnectionChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`wifiConnectionChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0029
        * @tc.name testWifiScanStateChange
        * @tc.desc Test wifiScanStateChange API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0029', 0, async function (done) {
            let wifiState = "wifiScanStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`wifiScanStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`wifiScanStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0030
        * @tc.name testWifiRssiChange
        * @tc.desc Test wifiRssiChange API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0030', 0, async function (done) {
            let wifiState = "wifiRssiChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`wifiRssiChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`wifiRssiChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0031
        * @tc.name testHotspotStateChange
        * @tc.desc Test hotspotStateChange API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0031', 0, async function (done) {
            let wifiState = "hotspotStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`hotspotStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`hotspotStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0032
        * @tc.name testP2pStateChange
        * @tc.desc Test p2pStateChange API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0032', 0, async function (done) {
            let wifiState = "p2pStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0033
        * @tc.name testP2pConnectionChange
        * @tc.desc Test p2pConnectionChange API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0033', 0, async function (done) {
            let wifiState = "p2pConnectionChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pConnectionChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pConnectionChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pConnectionChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0034
        * @tc.name testP2pDeviceChange
        * @tc.desc Test p2pDeviceChange API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0034', 0, async function (done) {
            let wifiState = "p2pDeviceChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pDeviceChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pDeviceChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pDeviceChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0035
        * @tc.name testP2pPeerDeviceChange
        * @tc.desc Test p2pPeerDeviceChange API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0035', 0, async function (done) {
            let wifiState = "p2pPeerDeviceChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pPeerDeviceChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pPeerDeviceChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pPeerDeviceChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0036
        * @tc.name testP2pPersistentGroupChange
        * @tc.desc Test p2pPersistentGroupChange API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0036', 0, async function (done) {
            let wifiState = "p2pPersistentGroupChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pPersistentGroupChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pPersistentGroupChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pPersistentGroupChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0037
        * @tc.name testP2pDiscoveryChange
        * @tc.desc Test p2pDiscoveryChange API ErrorCode 401.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0037', 0, async function (done) {
            let wifiState = "p2pDiscoveryChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pDiscoveryChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pDiscoveryChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
            } catch (error) {
                console.error(`p2pDiscoveryChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}

