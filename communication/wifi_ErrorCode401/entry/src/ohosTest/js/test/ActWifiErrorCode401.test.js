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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium";

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
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0005
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0005
         * @tc.desc   Test RemoveCandidateConfig API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try{
                await wifiMg.addCandidateConfig(null)
                    .then(netWorkId => {
                        console.info("[wifi_test]add OPEN CandidateConfig promise : " + JSON.stringify(netWorkId));
                        expect().assertFail();
                    }).catch((error) => {
                        console.error('[wifi_test]add OPEN CandidateConfig promise failed -> ' + JSON.stringify(error));
                        expect(true).assertEqual( (JSON.stringify(error)) !=null);
                    });
            }catch(err){
                console.error('[wifi_test]add OPEN CandidateConfig permission failed -> ' + JSON.stringify(err));
                expect(err.code).assertEqual("401");
            }
            done();
	    })
        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0006
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0006
         * @tc.desc   Test RemoveCandidateConfig API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try{
                let wifiDeviceConfig2  = {
                       "ssid": "TEST_connect",
                       "bssid": "22:9b:e6:48:1f:5c",
                       "preSharedKey": "12345678",
                       "isHiddenSsid": false,
                       "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                }
                function addCandidate() {
                   return new Promise((resolve, reject) => {
                       wifiMg.addCandidateConfig(null,
                           (err, netWorkId) => {
                               if (err) {
                                   console.info("[wifi_test]add CandidateConfig callback failed2 : " + JSON.stringify(err));
                                   return;
                               }
                               console.info("[wifi_test]addCandidateConfig callback result: " + JSON.stringify(netWorkId));
                               expect().assertFail();
                               resolve();
                           });
                   });
               }
               await addCandidate();
           }catch(error){
               console.error('[wifi_test]add OPEN CandidateConfig permission failed -> ' + JSON.stringify(error));
               expect(error.code).assertEqual("401");
           }
           done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0007
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0007
         * @tc.desc   Test RemoveCandidateConfig API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                let result = await wifiMg.removeCandidateConfig(null);
                console.info("[wifi_test] removeCandidateConfig  promise successful ");
                expect().assertFail();
            } catch(error) {
                console.error(`removeCandidate promise failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
           done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0008
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0008
         * @tc.desc   Test RemoveCandidateConfig API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                wifiMg.removeCandidateConfig(null,
                    error => {
                        if (error) {
                            console.error(`removeCand callback, code ${error.code}, message ${error.message}`);
                            expect(error.code).assertEqual("401")
                            return;
                        }
                        console.info("[wifi_test] removeCandidateConfig callback successful" );
                        expect().assertFail();
                    });
            } catch (error) {
                console.error(`removeCandidateConfig failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0009
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0009
         * @tc.desc   Test ConnectToCandidateConfig API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                wifiMg.connectToCandidateConfig("null");
                console.info("[wifi_test] connectToCandidateConfig successful " );
                expect().assertFail();
            } catch(error) {
                console.error(`connectToCandidateConfig failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0014
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0014
         * @tc.desc   Test GetSignalLevel API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel('abc','bcd'));
                expect().assertFail();
            } catch(error) {
                console.error(`getSignalLevel failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0017
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0017
         * @tc.desc   Test isFeatureSupported API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                let isSupport1 = wifiMg.isFeatureSupported('123');
                console.info("[wifi_test] isFeatureSupported -> " + isSupport1);
                expect().assertFail();
            } catch(error) {
                console.error(`isFeatureSupported failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0026
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0026
         * @tc.desc   Test createGroup API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let createGroup = wifiMg.createP2pGroup(null);
                expect().assertFail();
            } catch (error) {
                console.error(`createGroup failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0020
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0020
         * @tc.desc   Test p2pConnect API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                let p2pConnectResult = wifiMg.p2pConnect(null);
                expect().assertFail();
            } catch(error) {
                console.error(`p2pConnect failed, code ${error.code}, message ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0027
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0027
         * @tc.desc   Test wifiStateChange API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "wifiStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`wifiStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`wifiStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0028
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0028
         * @tc.desc   Test wifiConnectionChange API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "wifiConnectionChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`wifiConnectionChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`wifiConnectionChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0029
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0029
         * @tc.desc   Test wifiScanStateChange API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "wifiScanStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`wifiScanStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`wifiScanStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0030
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0030
         * @tc.desc   Test wifiRssiChange API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "wifiRssiChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`wifiRssiChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`wifiRssiChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0031
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0031
         * @tc.desc   Test hotspotStateChange API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "hotspotStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`hotspotStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`hotspotStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0032
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0032
         * @tc.desc   Test p2pStateChange API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0033
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0033
         * @tc.desc   Test p2pConnectionChange API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pConnectionChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pConnectionChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pConnectionChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pConnectionChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0034
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0034
         * @tc.desc   Test p2pDeviceChange API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pDeviceChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pDeviceChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pDeviceChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pDeviceChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0035
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0035
         * @tc.desc   Test p2pPeerDeviceChange API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pPeerDeviceChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pPeerDeviceChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pPeerDeviceChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pPeerDeviceChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0036
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0036
         * @tc.desc   Test p2pPersistentGroupChange API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pPersistentGroupChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pPersistentGroupChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pPersistentGroupChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pPersistentGroupChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0037
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0037
         * @tc.desc   Test p2pDiscoveryChange API ErrorCode 401.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pDiscoveryChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pDiscoveryChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pDiscoveryChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            try {
                wifiMg.off(1,wifiState, wifiStateChangeCallback);
                expect().assertFail();
            } catch (error) {
                console.error(`p2pDiscoveryChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("401")
            }
            done();
        })

        /**
         * @tc.name   Sub_Communication_WiFi_GetSignalLevel_Null_Nop_001
         * @tc.number Sub_Communication_WiFi_GetSignalLevel_Null_Nop_001
         * @tc.desc   Test getSignalLevel API with null rssi parameter(已废弃接口，无错误码，结果返回false)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_GetSignalLevel_Null_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_GetSignalLevel_Null_Nop_001';
            console.info(`${caseName} test start`);
            try {
            let result = wifi.getSignalLevel(null, null);
            console.log(`${caseName} get result success `, JSON.stringify(result));
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });
    
        /**
         * @tc.name   Sub_Communication_WiFi_GetSignalLevel_Undefined_Nop_001
         * @tc.number Sub_Communication_WiFi_GetSignalLevel_Undefined_Nop_001
         * @tc.desc   Test getSignalLevel API with undefined rssi parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_GetSignalLevel_Undefined_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_GetSignalLevel_Undefined_Nop_001';
            console.info(`${caseName} test start`);
            try {
            let result = wifi.getSignalLevel(undefined, undefined);
            console.log(`${caseName} get result success `, result);
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });
    
        /**
         * @tc.name   Sub_Communication_WiFi_IsFeatureSupported_Null_Nop_001
         * @tc.number Sub_Communication_WiFi_IsFeatureSupported_Null_Nop_001
         * @tc.desc   Test isFeatureSupported API with null featureId parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_IsFeatureSupported_Null_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_IsFeatureSupported_Null_Nop_001';
            console.info(`${caseName} test start`);
            try {
            let result = wifi.isFeatureSupported(null);
            console.log(`${caseName} get result success `, result);
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });
    
        /**
         * @tc.name   Sub_Communication_WiFi_IsFeatureSupported_Undefined_Nop_001
         * @tc.number Sub_Communication_WiFi_IsFeatureSupported_Undefined_Nop_001
         * @tc.desc   Test isFeatureSupported API with undefined featureId parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_IsFeatureSupported_Undefined_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_IsFeatureSupported_Undefined_Nop_001';
            console.info(`${caseName} test start`);
            try {
            let result = wifi.isFeatureSupported(undefined);
            console.log(`${caseName} get result success `, result);
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });
    
    
        /**
         * @tc.name   Sub_Communication_WiFi_AddUntrustedConfig_Null_001
         * @tc.number Sub_Communication_WiFi_AddUntrustedConfig_Null_001
         * @tc.desc   Test addUntrustedConfig API with null parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_AddUntrustedConfig_Null_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_AddUntrustedConfig_Null_001';
            console.info(`${caseName} test start`);
            try {
            let result = await wifi.addUntrustedConfig(null);
            console.log(`${caseName} get result success `, result);
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });
    
        /**
         * @tc.name   Sub_Communication_WiFi_AddUntrustedConfig_Undefined_001
         * @tc.number Sub_Communication_WiFi_AddUntrustedConfig_Undefined_001
         * @tc.desc   Test addUntrustedConfig API with undefined parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_AddUntrustedConfig_Undefined_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_AddUntrustedConfig_Undefined_001';
            console.info(`${caseName} test start`);
            try {
            let result = await wifi.addUntrustedConfig(undefined);
            console.log(`${caseName} get result success `, result);
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });
    
    
        /**
         * @tc.name   Sub_Communication_WiFi_RemoveUntrustedConfig_Null_001
         * @tc.number Sub_Communication_WiFi_RemoveUntrustedConfig_Null_001
         * @tc.desc   Test removeUntrustedConfig API with null parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_RemoveUntrustedConfig_Null_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_RemoveUntrustedConfig_Null_001';
            console.info(`${caseName} test start`);
            try {
            let result = await wifi.removeUntrustedConfig(null);
            console.log(`${caseName} get result success `, result);
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });
    
        /**
         * @tc.name   Sub_Communication_WiFi_RemoveUntrustedConfig_Undefined_001
         * @tc.number Sub_Communication_WiFi_RemoveUntrustedConfig_Undefined_001
         * @tc.desc   Test removeUntrustedConfig API with undefined parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_RemoveUntrustedConfig_Undefined_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_RemoveUntrustedConfig_Undefined_001';
            console.info(`${caseName} test start`);
            try {
            let result = await wifi.removeUntrustedConfig(undefined);
            console.log(`${caseName} get result success `, result);
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });
    
        /**
         * @tc.name   Sub_Communication_WiFi_CreateGroup_Null_001
         * @tc.number Sub_Communication_WiFi_CreateGroup_Null_001
         * @tc.desc   Test createGroup API with null parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_CreateGroup_Null_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_CreateGroup_Null_001';
            console.info(`${caseName} test start`);
            try {
            let result = wifi.createGroup(null);
            console.log(`${caseName} get result success `, result);
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });
    
        /**
         * @tc.name   Sub_Communication_WiFi_CreateGroup_Undefined_001
         * @tc.number Sub_Communication_WiFi_CreateGroup_Undefined_001
         * @tc.desc   Test createGroup API with undefined parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_CreateGroup_Undefined_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_CreateGroup_Undefined_001';
            console.info(`${caseName} test start`);
            try {
            let result = wifi.createGroup(undefined);
            console.log(`${caseName} get result success `, result);
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });
    
    
        /**
         * @tc.name   Sub_Communication_WiFi_P2pConnect_Null_001
         * @tc.number Sub_Communication_WiFi_P2pConnect_Null_001
         * @tc.desc   Test p2pConnect API with null parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_P2pConnect_Null_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_P2pConnect_Null_001';
            console.info(`${caseName} test start`);
            try {
            let result = wifi.p2pConnect(null);
            console.log(`${caseName} get result success `, result);
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });
    
        /**
         * @tc.name   Sub_Communication_WiFi_P2pConnect_Undefined_001
         * @tc.number Sub_Communication_WiFi_P2pConnect_Undefined_001
         * @tc.desc   Test p2pConnect API with undefined parameter
         * @tc.type   FUNCTION
         * @tc.size   M
         * @tc.level  LEVEL2
         */
        it('Sub_Communication_WiFi_P2pConnect_Undefined_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let caseName = 'Sub_Communication_WiFi_P2pConnect_Undefined_001';
            console.info(`${caseName} test start`);
            try {
            let result = wifi.p2pConnect(undefined);
            console.log(`${caseName} get result success `, result);
            expect(result).assertEqual(false);
            } catch (error) {
            console.info(`${caseName} error`, JSON.stringify(error));
            expect(Number(error.code)).assertEqual(401);
            }
            console.info(`${caseName} test end`);
            done();
        });

        /**
             * @tc.name   Sub_Communication_WiFiManager_GetSignalLevel_Null_Nop_001
             * @tc.number Sub_Communication_WiFiManager_GetSignalLevel_Null_Nop_001
             * @tc.desc   Test getSignalLevel API with null rssi parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_GetSignalLevel_Null_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManagerManager_GetSignalLevel_Null_Nop_001'
              console.info(`${caseName} test start`);
              try {
                let result = wifiMg.getSignalLevel(null, null);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_GetSignalLevel_Undefined_Nop_001
             * @tc.number Sub_Communication_WiFiManager_GetSignalLevel_Undefined_Nop_001
             * @tc.desc   Test getSignalLevel API with undefined rssi parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_GetSignalLevel_Undefined_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_GetSignalLevel_Undefined_Nop_001'
              console.info(`${caseName} test start`);
              try {
                let result = wifiMg.getSignalLevel(undefined, undefined);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error.code),JSON.stringify(error.message));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_IsFeatureSupported_Null_Nop_001
             * @tc.number Sub_Communication_WiFiManager_IsFeatureSupported_Null_Nop_001
             * @tc.desc   Test isFeatureSupported API with null featureId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_IsFeatureSupported_Null_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_IsFeatureSupported_Null_Nop_001'
              console.info(`${caseName} test start`);
              try {
                let result = wifiMg.isFeatureSupported(null);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_IsFeatureSupported_Undefined_Nop_001
             * @tc.number Sub_Communication_WiFiManager_IsFeatureSupported_Undefined_Nop_001
             * @tc.desc   Test isFeatureSupported API with undefined featureId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_IsFeatureSupported_Undefined_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_IsFeatureSupported_Undefined_Nop_001'
              console.info(`${caseName} test start`);
              try {
                let result = wifiMg.isFeatureSupported(undefined);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_RemoveCandidateConfig_Null_Nop_001
             * @tc.number Sub_Communication_WiFiManager_RemoveCandidateConfig_Null_Nop_001
             * @tc.desc   Test removeCandidateConfig Promise API with null networkId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_RemoveCandidateConfig_Null_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_RemoveCandidateConfig_Null_Nop_001'
              console.info(`${caseName} test start`);
              try {
                let result = await wifiMg.removeCandidateConfig(null);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_RemoveCandidateConfig_Undefined_Nop_001
             * @tc.number Sub_Communication_WiFiManager_RemoveCandidateConfig_Undefined_Nop_001
             * @tc.desc   Test removeCandidateConfig Promise API with undefined networkId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_RemoveCandidateConfig_Undefined_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_RemoveCandidateConfig_Undefined_Nop_001'
              console.info(`${caseName} test start`);
              try {
                let result = await wifiMg.removeCandidateConfig(undefined);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_RemoveCandidateConfig_Null_Nop_002
             * @tc.number Sub_Communication_WiFiManager_RemoveCandidateConfig_Null_Nop_002
             * @tc.desc   Test removeCandidateConfig callback API with null networkId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_RemoveCandidateConfig_Null_Nop_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_RemoveCandidateConfig_Null_Nop_002'
              console.info(`${caseName} test start`);
              try {
                wifiMg.removeCandidateConfig(null, (err, data) => {
                  if (err) {
                    console.info(`${caseName} callback error`, JSON.stringify(err));
                    ExpectTrue(Number(err.code) === 401);
                    done();
                    return;
                  }
                  console.log(`${caseName} callback success `, data);
                  expect().assertFail();
                  done();
                });
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
                done();
              }
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_RemoveCandidateConfig_Undefined_Nop_002
             * @tc.number Sub_Communication_WiFiManager_RemoveCandidateConfig_Undefined_Nop_002
             * @tc.desc   Test removeCandidateConfig callback API with undefined networkId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_RemoveCandidateConfig_Undefined_Nop_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_RemoveCandidateConfig_Undefined_Nop_002'
              console.info(`${caseName} test start`);
              try {
                wifiMg.removeCandidateConfig(undefined, (err, data) => {
                  if (err) {
                    console.info(`${caseName} callback error`, JSON.stringify(err));
                    ExpectTrue(Number(err.code) === 401);
                    done();
                    return;
                  }
                  console.log(`${caseName} callback success `, data);
                  expect().assertFail();
                  done();
                });
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
                done();
              }
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_ConnectToCandidateConfig_Null_Nop_001
             * @tc.number Sub_Communication_WiFiManager_ConnectToCandidateConfig_Null_Nop_001
             * @tc.desc   Test connectToCandidateConfig API with null networkId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_ConnectToCandidateConfig_Null_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_ConnectToCandidateConfig_Null_Nop_001'
              console.info(`${caseName} test start`);
              try {
                wifiMg.connectToCandidateConfig(null);
                console.log(`${caseName} get result success`);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_ConnectToCandidateConfig_Undefined_Nop_001
             * @tc.number Sub_Communication_WiFiManager_ConnectToCandidateConfig_Undefined_Nop_001
             * @tc.desc   Test connectToCandidateConfig API with undefined networkId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_ConnectToCandidateConfig_Undefined_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_ConnectToCandidateConfig_Undefined_Nop_001'
              console.info(`${caseName} test start`);
              try {
                wifiMg.connectToCandidateConfig(undefined);
                console.log(`${caseName} get result success`);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_connectToCandidateConfigWithUserAction_Null_Nop_001
             * @tc.number Sub_Communication_WiFiManager_connectToCandidateConfigWithUserAction_Null_Nop_001
             * @tc.desc   Test connectToCandidateConfigWithUserAction API with null networkId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_connectToCandidateConfigWithUserAction_Null_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_connectToCandidateConfigWithUserAction_Null_Nop_001'
              console.info(`${caseName} test start`);
              try {
                wifiMg.connectToCandidateConfigWithUserAction(null);
                console.log(`${caseName} get result success`);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_connectToCandidateConfigWithUserAction_Undefined_Nop_001
             * @tc.number Sub_Communication_WiFiManager_connectToCandidateConfigWithUserAction_Undefined_Nop_001
             * @tc.desc   Test connectToCandidateConfigWithUserAction API with undefined networkId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_connectToCandidateConfigWithUserAction_Undefined_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_connectToCandidateConfigWithUserAction_Undefined_Nop_001'
              console.info(`${caseName} test start`);
              try {
                wifiMg.connectToCandidateConfigWithUserAction(undefined);
                console.log(`${caseName} get result success`);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_ConnectToNetwork_Null_Nop_001
             * @tc.number Sub_Communication_WiFiManager_ConnectToNetwork_Null_Nop_001
             * @tc.desc   Test connectToNetwork API with null networkId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_ConnectToNetwork_Null_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_ConnectToNetwork_Null_Nop_001'
              console.info(`${caseName} test start`);
              try {
                wifiMg.connectToNetwork(null);
                console.log(`${caseName} get result success`);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_ConnectToNetwork_Undefined_Nop_001
             * @tc.number Sub_Communication_WiFiManager_ConnectToNetwork_Undefined_Nop_001
             * @tc.desc   Test connectToNetwork API with undefined networkId parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_ConnectToNetwork_Undefined_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_ConnectToNetwork_Undefined_Nop_001'
              console.info(`${caseName} test start`);
              try {
                wifiMg.connectToNetwork(undefined);
                console.log(`${caseName} get result success`);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_RemoveDevice_Null_Nop_001
             * @tc.number Sub_Communication_WiFiManager_RemoveDevice_Null_Nop_001
             * @tc.desc   Test removeDevice API with null id parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_RemoveDevice_Null_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_RemoveDevice_Null_Nop_001'
              console.info(`${caseName} test start`);
              try {
                wifiMg.removeDevice(null);
                console.log(`${caseName} get result success`);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_RemoveDevice_Undefined_Nop_001
             * @tc.number Sub_Communication_WiFiManager_RemoveDevice_Undefined_Nop_001
             * @tc.desc   Test removeDevice API with undefined id parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_RemoveDevice_Undefined_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_RemoveDevice_Undefined_Nop_001'
              console.info(`${caseName} test start`);
              try {
                wifiMg.removeDevice(undefined);
                console.log(`${caseName} get result success`);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Null_001
             * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Null_001
             * @tc.desc   Test addDeviceConfig API with null parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_AddDeviceConfig_Null_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Null_001';
              console.info(`${caseName} test start`);
              try {
                let result = await wifiMg.addDeviceConfig(null);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Undefined_001
             * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Undefined_001
             * @tc.desc   Test addDeviceConfig API with undefined parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_AddDeviceConfig_Undefined_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Undefined_001';
              console.info(`${caseName} test start`);
              try {
                let result = await wifiMg.addDeviceConfig(undefined);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Null_001
             * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Null_001
             * @tc.desc   Test addCandidateConfig API with null parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_AddCandidateConfig_Null_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Null_001';
              console.info(`${caseName} test start`);
              try {
                let result = await wifiMg.addCandidateConfig(null);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Undefined_001
             * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Undefined_001
             * @tc.desc   Test addCandidateConfig API with undefined parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_AddCandidateConfig_Undefined_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Undefined_001';
              console.info(`${caseName} test start`);
              try {
                let result = await wifiMg.addCandidateConfig(undefined);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_CreateGroup_Null_001
             * @tc.number Sub_Communication_WiFiManager_CreateGroup_Null_001
             * @tc.desc   Test createGroup API with null parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_CreateGroup_Null_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_CreateGroup_Null_001';
              console.info(`${caseName} test start`);
              try {
                let result = wifiMg.createGroup(null);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_CreateGroup_Undefined_001
             * @tc.number Sub_Communication_WiFiManager_CreateGroup_Undefined_001
             * @tc.desc   Test createGroup API with undefined parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_CreateGroup_Undefined_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_CreateGroup_Undefined_001';
              console.info(`${caseName} test start`);
              try {
                let result = wifiMg.createGroup(undefined);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_P2pConnect_Null_001
             * @tc.number Sub_Communication_WiFiManager_P2pConnect_Null_001
             * @tc.desc   Test p2pConnect API with null parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_P2pConnect_Null_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_P2pConnect_Null_001';
              console.info(`${caseName} test start`);
              try {
                let result = wifiMg.p2pConnect(null);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        
            /**
             * @tc.name   Sub_Communication_WiFiManager_P2pConnect_Undefined_001
             * @tc.number Sub_Communication_WiFiManager_P2pConnect_Undefined_001
             * @tc.desc   Test p2pConnect API with undefined parameter
             * @tc.type   FUNCTION
             * @tc.size   MEDIUMTEST
             * @tc.level  LEVEL2
             */
            it('Sub_Communication_WiFiManager_P2pConnect_Undefined_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
              let caseName = 'Sub_Communication_WiFiManager_P2pConnect_Undefined_001';
              console.info(`${caseName} test start`);
              try {
                let result = wifiMg.p2pConnect(undefined);
                console.log(`${caseName} get result success `, result);
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName} error`, JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
              }
              console.info(`${caseName} test end`);
              done();
            });
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}

