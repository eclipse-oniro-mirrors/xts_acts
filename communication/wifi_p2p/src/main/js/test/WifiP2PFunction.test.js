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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

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
    console.info("[wifi_test]/wifi status:" + wifi.isWifiActive());
}

export default function actsWifiFunctionTest() {
    describe('actsWifiFunctionTest', function () {
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
        * @tc.number Communication_WiFi_XTS_P2P_0003
        * @tc.name testCreateGroup
        * @tc.desc Test createGroup and getCurrentGroup API Function
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_XTS_P2P_0003', 0, async function(done) {
            let wifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "DIRECT-AAAZZZ123",
                goBand : wifi.GroupOwnerBand.GO_BAND_2GHZ,
            };
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.log("[wifi_test]createGroup result: " + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertTrue();
            try {
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result :" + JSON.stringify(data));
                        expect(true).assertEqual(data.groupName != null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error != null);
                    });
            }catch(error){
                console.info("[wifi_test]getCurrentGroup promise error: " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            function getCurrentGroupResult(){
                return new Promise((resolve, reject) => {
                    wifi.getCurrentGroup(
                        (err, result) => {
                            if(err) {
                                console.info("[wifi_test]failed to get getCurrentGroup:" + JSON.stringify(err));
                                expect().assertFail();
                            }
                            console.info("[wifi_test]getCurrentGroup callback:" + JSON.stringify(result));
                            console.info("isP2pGo: " + result.isP2pGo +
                            "deviceName: " + result.ownerInfo.deviceName +
                            "deviceAddress: " + result.ownerInfo.deviceAddress +
                            "primaryDeviceType: " + result.ownerInfo.primaryDeviceType +
                            "deviceStatus: " + result.ownerInfo.deviceStatus +
                            "groupCapabilitys: " + result.ownerInfo.groupCapabilitys +
                            "passphrase: " + result.passphrase + "interface: "+ result.interface
                            + "groupName: " + result.groupName +
                            "frequency: " + result.frequency + "goIpAddress: " + result.goIpAddress);
                            console.info("[wifi_test] clientDevices:" + JSON.stringify(result.clientDevices));
                            console.info("[wifi_test] ownerInfo:" + JSON.stringify(result.WifiP2pDevice));
                            resolve();
                        });
                });
            }
            await getCurrentGroupResult();
            let removeGroupResult = wifi.removeGroup();
            await sleep(2000);
            expect(removeGroupResult).assertTrue();
            try {
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed1 :' + JSON.stringify(error));
                        expect(true).assertEqual(error != null);
                    });
            }catch(error){
                console.info("[wifi_test]getCurrentGroup promise error1: " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0004
        * @tc.name testCreateGroup
        * @tc.desc Test createGroup-Setting a 7-bit Key Function.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_XTS_P2P_0004', 0, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "1234567",
                groupName: "DIRECT-test_pass",
                goBand: wifi.GroupOwnerBand.GO_BAND_2GHZ,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.info("[wifi_test]test createGroup end." + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertFalse();
            await wifi.getCurrentGroup()
                .then(data => {
                    console.info("[wifi_test] getCurrentGroup  promise result :" + JSON.stringify(data));
                    expect(true).assertEqual(data.networkId == -999);
                }).catch((error) => {
                    console.error('[wifi_test] getCurrentGroup  promise failed :' + JSON.stringify(error));
                    expect(true).assertEqual(error !=null);
                });
            let removeGroupResult = wifi.removeGroup();
            await sleep(2000);
            expect(removeGroupResult).assertFalse();
            try {
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed1 :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]getCurrentGroup promise error: " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0104
        * @tc.name testCreateGroup
        * @tc.desc Test createGroup-Key setting: Chinese, English, and characters Function.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_XTS_P2P_0104', 0, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "123@%abcD",
                groupName: "DIRECT-test_pass1",
                goBand: wifi.GroupOwnerBand.GO_BAND_2GHZ,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.info("[wifi_test]test createGroup end." + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    console.info("[wifi_test]getCurrentGroup  promise result : " + JSON.stringify(data));
                    expect(true).assertEqual(data.passphrase == wifiP2PConfig.passphrase);
                });
            let removeGroupResult = wifi.removeGroup();
            await sleep(2000);
            expect(removeGroupResult).assertTrue();
            try {
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]getCurrentGroup promise error: " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0204
        * @tc.name testCreateGroup
        * @tc.desc Test createGroup-Key setting 64 bit Function.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_XTS_P2P_0204', 0, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "abc345678901234567890123456789012345678901234567890123456789012",
                groupName: "DIRECT-test_pass2",
                goBand: wifi.GroupOwnerBand.GO_BAND_2GHZ,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.info("[wifi_test]test createGroup end." + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    console.info("[wifi_test]getCurrentGroup promise result : " + JSON.stringify(data));
                    expect(true).assertEqual(data.passphrase == wifiP2PConfig.passphrase);
                });
            let removeGroupResult = wifi.removeGroup();
            await sleep(2000);
            expect(removeGroupResult).assertTrue();
            try {
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]getCurrentGroup promise error: " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0304
        * @tc.name testCreateGroup
        * @tc.desc Test createGroup-Key setting 65 bitsFunction.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_XTS_P2P_0304', 0, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "abc3456789012345678901234567890123456789012345678901234567890123",
                groupName: "DIRECT-test_pass3",
                goBand: wifi.GroupOwnerBand.GO_BAND_2GHZ,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            console.info("[wifi_test]test createGroup end." + JSON.stringify(createGroupResult));
            await sleep(2000);
            expect(createGroupResult).assertFalse();
            await wifi.getCurrentGroup()
                .then(data => {
                    console.info("[wifi_test]getCurrentGroup  promise result :" + JSON.stringify(data));
                    expect(true).assertEqual(data.passphrase != wifiP2PConfig.passphrase);
                }).catch((error) => {
                    console.error('[wifi_test] getCurrentGroup  promise failed :' + JSON.stringify(error));
                    expect(true).assertEqual(error !=null);
                });
            let removeGroupResult = wifi.removeGroup();
            await sleep(2000);
            expect(removeGroupResult).assertFalse();
            try {
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed1 :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]getCurrentGroup promise error: " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0007
        * @tc.name testCreateGroup
        * @tc.desc Test createGroup-2.4 GHz frequency band setting Function
        * @tc.type Function
        * @tc.level Level 0
        */
        it('Communication_WiFi_XTS_P2P_0007', 0, async function(done) {
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "DIRECT-test_band1",
                goBand : wifi.GroupOwnerBand.GO_BAND_2GHZ,
            };
            let createGroupResult = wifi.createGroup(wifiP2PConfig);
            await sleep(2000);
            console.info("[wifi_test] test createGroup result." + createGroupResult)
            expect(createGroupResult).assertTrue();
            await wifi.getCurrentGroup()
                .then(data => {
                    console.info("[wifi_test]getCurrentGroup  promise result :" + JSON.stringify(data));
                    expect(true).assertEqual(2412 < data.frequency < 2484 );
                });
            let removeGroupResult = wifi.removeGroup();
            await sleep(2000);
            expect(removeGroupResult).assertTrue();
            try {
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]getCurrentGroup promise error: " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0107
        * @tc.name testCreateGroup
        * @tc.desc Test createGroup-5 GHz frequency band setting Function
        * @tc.type Function
        * @tc.level Level 0
        */
        it('Communication_WiFi_XTS_P2P_0107', 0, async function(done) {
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            try {
                let wifiP2PConfig = {
                    deviceAddress : "00:00:00:00:00:00",
                    netId : -1,
                    passphrase : "12345678",
                    groupName : "DIRECT-test_band2",
                    goBand : wifi.GroupOwnerBand.GO_BAND_5GHZ,
                };
                let createGroupResult = wifi.createGroup(wifiP2PConfig);
                await sleep(2000);
                console.info("[wifi_test]test createGroup result." + createGroupResult)
                expect(createGroupResult).assertTrue();
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error != null);
                    });
                let removeGroupResult = await wifi.removeGroup();
                await sleep(2000);
                expect(removeGroupResult).assertTrue();
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed1 :' + JSON.stringify(error));
                        expect(true).assertEqual(error != null);
                    });
            }catch(error){
                console.info("[wifi_test]createGroup 5G goBand fail : " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0207
        * @tc.name testCreateGroup
        * @tc.desc Test createGroup-Auto frequency band setting Function
        * @tc.type Function
        * @tc.level Level 0
        */
        it('Communication_WiFi_XTS_P2P_0207', 0, async function(done) {
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            try {
                let wifiP2PConfig = {
                    deviceAddress : "00:00:00:00:00:00",
                    netId : -1,
                    passphrase : "12345678",
                    groupName : "DIRECT-test_band3",
                    goBand : wifi.GroupOwnerBand.GO_BAND_AUTO,
                };
                let createGroupResult = wifi.createGroup(wifiP2PConfig);
                await sleep(2000);
                console.info("[wifi_test]test createGroup result." + createGroupResult)
                expect(createGroupResult).assertTrue();
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test]getCurrentGroup promise result : " + JSON.stringify(data));
                        expect(true).assertEqual(data.frequency != null );
                    });
                let removeGroupResult = await wifi.removeGroup();
                await sleep(2000);
                expect(removeGroupResult).assertTrue();
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]createGroup auto  goBand result : " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0009
        * @tc.name testP2pCancelConnect
        * @tc.desc Test p2pCancelConnect Group API functionality.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_XTS_P2P_0009', 0, async function (done) {
            let wifiP2PConfig = {
                deviceAddress : "11:22:33:44:55:66",
                netId : -1,
                passphrase : "12345678",
                groupName : "DIRECT-AAAZZZ456",
                goBand : wifi.GroupOwnerBand.GO_BAND_2GHZ,
            };
            let p2pConnectResult = wifi.p2pConnect(wifiP2PConfig);
            console.info("[wifi_test]test p2pConnect result." + p2pConnectResult);
            let p2pCancelResult = wifi.p2pCancelConnect();
            await sleep(2000);
            console.info("[wifi_test]test p2pCancelConnect result." + p2pCancelResult);
            expect(p2pCancelResult).assertTrue();
            let removeGroupResult = wifi.removeGroup();
            console.info("[wifi_test]test start removeGroup:" + removeGroupResult);
            expect(removeGroupResult).assertFalse();
            try {
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]getCurrentGroup promise error: " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0011
        * @tc.name testRemoveGroup
        * @tc.desc Test remove a nonexistent group.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_XTS_P2P_0011', 0, async function (done) {
            let removeGroupResult = wifi.removeGroup(10000);
            console.info("[wifi_test]removeGroup(10000) result : " + JSON.stringify(removeGroupResult));
            expect(removeGroupResult).assertFalse();
            try {
                await wifi.getCurrentGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]getCurrentGroup  promise error message : " + JSON.stringify(error.message));
                expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
            }
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0010
        * @tc.name testGetP2pLinkedInfo
        * @tc.desc Test getP2pLinkedInfo API functionality
        * @tc.type Function
        * @tc.level Level 2
        */
        it('Communication_WiFi_XTS_P2P_0010', 0, async function(done) {
            let P2pConnectState = {
                DISCONNECTED :0,
                CONNECTED : 1,
            };
            await wifi.getP2pLinkedInfo()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getP2pLinkedInfo promise result :" + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    done()
                });
            function getP2pLinkedInfoResult(){
                return new Promise((resolve, reject) => {
                    wifi.getP2pLinkedInfo(
                        (err, result) => {
                            if(err) {
                                console.info("[wifi_test]failed to getP2pLinkedInfo callback:" + JSON.stringify(err));
                                return;
                            }
                            let resultLength = Object.keys(result).length;
                            console.info("[wifi_test]getP2pLinkedInfo callback:" + JSON.stringify(resultLength));
                            console.info("connectState: " + result.connectState +
                            "isGroupOwner: " + result.isGroupOwner +
                            "groupOwnerAddr: " + result.groupOwnerAddr);
                            expect(true).assertEqual(resultLength!=0);
                            resolve();
                        });
                });
            }
            await getP2pLinkedInfoResult();
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0001
        * @tc.name testGetP2pPeerDevices
        * @tc.desc Test getP2pPeerDevices promise API functionality
        * @tc.type Function
        * @tc.level Level 0
        */
        it('Communication_WiFi_XTS_P2P_0001', 0, async function(done){
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let startDiscover = wifi.startDiscoverDevices();
            await sleep(2000);
            expect(startDiscover).assertTrue();
            await wifi.getP2pPeerDevices()
                .then((data)  => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getP2pPeerDevices  promise result -> " + JSON.stringify(data));
                    expect(true).assertEqual(resultLength >= 0);
                }).catch((error) => {
                    console.info("[wifi_test]getP2pPeerDevices promise then error." + JSON.stringify(error));
                    expect().assertFail();
                });
            let stopDiscover = wifi.stopDiscoverDevices();
            console.info("[wifi_test]test stopDiscoverDevices result." + stopDiscover);
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_P2P_0101
        * @tc.name testGetP2pPeerDevices
        * @tc.desc Test getP2pPeerDevices callback API functionality
        * @tc.type Function
        * @tc.level Level 0
        */
        it('Communication_WiFi_XTS_P2P_0101', 0, async function(done){
            console.log("[wifi_test]check the state of wifi: " + wifi.isWifiActive());
            expect(wifi.isWifiActive()).assertTrue();
            let startDiscover = wifi.startDiscoverDevices();
            await sleep(2000);
            expect(startDiscover).assertTrue();

            function getP2pPeerDevicesResult(){
                return new Promise((resolve, reject) => {
                    wifi.getP2pPeerDevices(
                        (err, result) => {
                            if(err) {
                                console.error('[wifi_test]failed to getP2pPeerDevices :' + JSON.stringify(err));
                            }
                            console.info("[wifi_test] getP2pPeerDevices callback result :" + JSON.stringify(result));
                            let len = Object.keys(result).length;
                            for (let j = 0; j < len; ++j) {
                                console.info("deviceName: " + result[j].deviceName +
                                "deviceAddress: " + result[j].deviceAddress +
                                "primaryDeviceType: " + result[j].primaryDeviceType +
                                "deviceStatus: " + result[j].deviceStatus +
                                "groupCapabilitys: " + result[j].groupCapabilitys );
                                if(result[j].deviceStatus == wifi.P2pDeviceStatus.UNAVAILABLE){
                                    console.info("deviceStatus: " + result[j].deviceStatus);
                                }
                                if(result[j].deviceStatus == wifi.P2pDeviceStatus.CONNECTED){
                                    console.info("deviceStatus: " + result[j].deviceStatus);
                                }
                                if(result[j].deviceStatus == wifi.P2pDeviceStatus.INVITED){
                                    console.info("deviceStatus: " + result[j].deviceStatus);
                                }
                                if(result[j].deviceStatus == wifi.P2pDeviceStatus.FAILED){
                                    console.info("deviceStatus: " + result[j].deviceStatus);
                                }
                                if(result[j].deviceStatus == wifi.P2pDeviceStatus.AVAILABLE){
                                    console.info("deviceStatus: " + result[j].deviceStatus);
                                }
                            }
                            resolve();




                        });
                });
            }
            await getP2pPeerDevicesResult();
            done();
        });
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}

