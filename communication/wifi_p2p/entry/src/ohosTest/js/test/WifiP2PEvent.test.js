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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

import wifi from '@ohos.wifi'
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
    console.info("[wifi_test]wifi status:" + wifi.isWifiActive());
}

export default function actsWifiEventTest() {
    describe('actsWifiEventTest', function () {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await applyPermission();
            done();
        })

        beforeEach(function () {
            console.info("[wifi_test]beforeEach start" );
            checkWifiPowerOn();
        })
        afterEach(async function () {
            console.info("[wifi_test]afterEach start" );
        })

        /**
        * @tc.number Communication_WiFi_Event_Test_0008
        * @tc.name testp2pStateChange
        * @tc.desc Test p2pStateChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_Event_Test_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let p2pState = "p2pStateChange";
            let p2pStateChangeCallback = result => {
                console.info("[wifi_test]p2pStateChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(p2pState, p2pStateChangeCallback);
            await sleep(3000);
            wifi.off(p2pState, p2pStateChangeCallback);
            done();
        })

        /**
        * @tc.number Communication_WiFi_Event_Test_0009
        * @tc.name testp2pConnectionChange
        * @tc.desc Test p2pConnectionChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_Event_Test_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let p2pConnectionState = "p2pConnectionChange";
            let p2pConnectionChangeCallback = result => {
                console.info("[wifi_test]p2pConnectionChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(p2pConnectionState, p2pConnectionChangeCallback);
            let wifiP2PConfig = {
                deviceAddress : "22:9b:e6:48:1f:5c",
                netId : -1,
                passphrase : "12345678",
                groupName : "DIRECT-AAAZZZ456",
                goBand : wifi.GroupOwnerBand.GO_BAND_AUTO
            };
            let connectResult = wifi.p2pConnect(wifiP2PConfig);
            console.info("[wifi_test]test p2pConnect result." + connectResult);
            let p2pCancelResult = wifi.p2pCancelConnect();
            await sleep(2000);
            console.info("[wifi_test]test p2pCancelConnect result." + p2pCancelResult);
            await wifi.getP2pLinkedInfo()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getP2pLinkedInfo  promise result : " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    done()
                });
            await sleep(2000);
            wifi.off(p2pConnectionState, p2pConnectionChangeCallback);
            done();
        })

        /**
        * @tc.number Communication_WiFi_Event_Test_0012
        * @tc.name testp2pDeviceChange
        * @tc.desc Test p2pDeviceChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_Event_Test_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let p2pDeviceState = "p2pDeviceChange";
            let p2pDeviceChangeCallback = result => {
                console.info("[wifi_test]p2pDeviceChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(p2pDeviceState, p2pDeviceChangeCallback);
            await sleep(3000);
            wifi.off(p2pDeviceState, p2pDeviceChangeCallback);
            done();
        })

        /**
        * @tc.number Communication_WiFi_Event_Test_0010
        * @tc.name testp2pPeerDeviceChange
        * @tc.desc Test p2pPeerDeviceChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_Event_Test_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let p2pPeerDeviceState = "p2pPeerDeviceChange";
            let p2pPeerDeviceChangeCallback = result => {
                console.info("[wifi_test]p2pPeerDeviceChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(p2pPeerDeviceState, p2pPeerDeviceChangeCallback);
            let startDiscover = wifi.startDiscoverDevices();
            await sleep(3000);
            expect(startDiscover).assertTrue();
            let stopDiscover = wifi.stopDiscoverDevices();
            console.info("[wifi_test] test stopDiscoverDevices result." + stopDiscover);
            wifi.off(p2pPeerDeviceState, p2pPeerDeviceChangeCallback);
            done();
        })

        /**
        * @tc.number Communication_WiFi_Event_Test_0013
        * @tc.name testp2pPersistentGroupChange
        * @tc.desc Test p2pPersistentGroupChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_Event_Test_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let p2pGroupState = "p2pPersistentGroupChange";
            let p2pPersistentGroupChangeCallback = () => {
                console.info("[wifi_test]p2pPersistentGroupChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(p2pGroupState, p2pPersistentGroupChangeCallback);
            let WifiP2PConfig = {
                deviceAddress : "22:9b:e6:48:1f:5c",
                netId : -2,
                passphrase : "12345678",
                groupName : "DIRECT-AAAZZZ123",
                goBand : wifi.GroupOwnerBand.GO_BAND_AUTO,
            };
            try {
                await wifi.getCurrentGroup()
                    .then(data => {
                        let resultLength = Object.keys(data).length;
                        console.info("[wifi_test] getCurrentGroup  promise result -> " + JSON.stringify(data));
                        expect(true).assertEqual(resultLength!=0);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]getCurrentGroup promise error: " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            wifi.off(p2pGroupState, p2pPersistentGroupChangeCallback);
            done();
        })

        /**
        * @tc.number Communication_WiFi_Event_Test_0011
        * @tc.name testpp2pDiscoveryChange
        * @tc.desc Test p2pDiscoveryChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_Event_Test_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let p2pPeerDeviceState = "p2pDiscoveryChange";
            let p2pDiscoveryChangeCallback = result => {
                console.info("[wifi_test]p2pDiscoveryChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(p2pPeerDeviceState, p2pDiscoveryChangeCallback);
            let startDiscover = wifi.startDiscoverDevices();
            await sleep(3000);
            expect(startDiscover).assertTrue();
            let stopDiscover = wifi.stopDiscoverDevices();
            console.info("[wifi_test] test stopDiscoverDevices result." + stopDiscover);
            wifi.off(p2pPeerDeviceState, p2pDiscoveryChangeCallback);
            done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}

