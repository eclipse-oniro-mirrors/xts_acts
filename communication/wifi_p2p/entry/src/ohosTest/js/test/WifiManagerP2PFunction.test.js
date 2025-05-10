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
    console.info("[wifi_test]/wifi status:" + wifiMg.isWifiActive());
}

export default function actsWifiManagerFunctionTest() {
    describe('actsWifiManagerFunctionTest', function () {
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
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0003
        * @tc.name testcreateP2pGroup
        * @tc.desc Test createP2pGroup and getCurrentP2pGroup API Function
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let wifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "DIRECT-AAAZZZ123",
                goBand : wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
            };
            console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
            expect(wifiMg.isWifiActive()).assertTrue();
            let createP2pGroupResult = wifiMg.createP2pGroup(wifiP2PConfig);
            await sleep(2000);
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            function getCurrentP2pGroupResult(){
                return new Promise((resolve, reject) => {
                    wifiMg.getCurrentP2pGroup(
                        (err, result) => {
                            if(err) {
                                console.info("[wifi_test]failed to get getCurrentP2pGroup:" + JSON.stringify(err));
                                expect().assertFail();
                            }
                            console.info("[wifi_test]getCurrentP2pGroup callback:" + JSON.stringify(result));
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
                            console.info("[wifi_test] WifiP2pDevice:" + JSON.stringify(result.WifiP2pDevice));
                            if (!result.WifiP2pDevice == undefined) {
                                console.info("[wifi_test] groupCapabilities:" + JSON.stringify(result.WifiP2pDevice.groupCapabilities));
                            }
                            resolve();
                        });
                });
            }
            await getCurrentP2pGroupResult();
            let removeP2pGroupResult = wifiMg.removeP2pGroup();
            await sleep(2000);
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed1 :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0004
        * @tc.name testcreateP2pGroup
        * @tc.desc Test createP2pGroup-Setting a 7-bit Key Function.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
            expect(wifiMg.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "1234567",
                groupName: "DIRECT-test_pass",
                goBand: wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
            };
            try {
                let createP2pGroupResult = wifiMg.createP2pGroup(wifiP2PConfig);
                await sleep(2000);
            }catch(error){
                console.info("[wifi_test]createP2pGroup error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result :" + JSON.stringify(data));
                        expect(true).assertEqual(data.networkId == -999);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            try {
                let removeP2pGroupResult = wifiMg.removeP2pGroup();
                await sleep(2000);
            }catch(error){
                console.info("[wifi_test]removeP2pGroup  error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed1 :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })


        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0104
        * @tc.name testcreateP2pGroup
        * @tc.desc Test createP2pGroup-Key setting: Chinese, English, and characters Function.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
            expect(wifiMg.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "123@%abcD",
                groupName: "DIRECT-test_pass1",
                goBand: wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
            };
            let createP2pGroupResult = wifiMg.createP2pGroup(wifiP2PConfig);
            await sleep(2000);
            await wifiMg.getCurrentP2pGroup()
                .then(data => {
                    console.info("[wifi_test]getCurrentP2pGroup  promise result : " + JSON.stringify(data));
                    expect(true).assertEqual(data.passphrase == wifiP2PConfig.passphrase);
                });
            let removeP2pGroupResult = wifiMg.removeP2pGroup();
            await sleep(2000);
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0204
        * @tc.name testcreateP2pGroup
        * @tc.desc Test createP2pGroup-Key setting 64 bit Function.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
            expect(wifiMg.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "abc345678901234567890123456789012345678901234567890123456789012",
                groupName: "DIRECT-test_pass2",
                goBand: wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
            };
            let createP2pGroupResult = wifiMg.createP2pGroup(wifiP2PConfig);
            await sleep(2000);
            await wifiMg.getCurrentP2pGroup()
                .then(data => {
                    console.info("[wifi_test]getCurrentP2pGroup promise result : " + JSON.stringify(data));
                    expect(true).assertEqual(data.passphrase == wifiP2PConfig.passphrase);
                });
            let removeP2pGroupResult = wifiMg.removeP2pGroup();
            await sleep(2000);
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0304
        * @tc.name testcreateP2pGroup
        * @tc.desc Test createP2pGroup-Key setting 65 bitsFunction.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
            expect(wifiMg.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress: "00:00:00:00:00:00",
                netId: -1,
                passphrase: "abc3456789012345678901234567890123456789012345678901234567890123",
                groupName: "DIRECT-test_pass3",
                goBand: wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
            };
            try {
                let createP2pGroupResult = wifiMg.createP2pGroup(wifiP2PConfig);
                await sleep(2000);
            }catch(error){
                console.info("[wifi_test]createP2pGroup error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result :" + JSON.stringify(data));
                        expect(true).assertEqual(data.networkId == -999);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            try {
                let removeP2pGroupResult = wifiMg.removeP2pGroup();
                await sleep(2000);
            }catch(error){
                console.info("[wifi_test]removeP2pGroup error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed1 :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0007
        * @tc.name testcreateP2pGroup
        * @tc.desc Test createP2pGroup-2.4 GHz frequency band setting Function
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
            expect(wifiMg.isWifiActive()).assertTrue();
            let wifiP2PConfig = {
                deviceAddress : "00:00:00:00:00:00",
                netId : -1,
                passphrase : "12345678",
                groupName : "DIRECT-test_band1",
                goBand : wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
            };
            let createP2pGroupResult = wifiMg.createP2pGroup(wifiP2PConfig);
            await sleep(2000);
            await wifiMg.getCurrentP2pGroup()
                .then(data => {
                    console.info("[wifi_test]getCurrentP2pGroup  promise result :" + JSON.stringify(data));
                    expect(true).assertEqual(2412 < data.frequency < 2484 );
                });
            let removeP2pGroupResult = wifiMg.removeP2pGroup();
            await sleep(2000);
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0107
        * @tc.name testcreateP2pGroup
        * @tc.desc Test createP2pGroup-5 GHz frequency band setting Function
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
            expect(wifiMg.isWifiActive()).assertTrue();
            try {
                let wifiP2PConfig = {
                    deviceAddress : "00:00:00:00:00:00",
                    netId : -1,
                    passphrase : "12345678",
                    groupName : "DIRECT-test_band2",
                    goBand : wifiMg.GroupOwnerBand.GO_BAND_5GHZ,
                };
                let createP2pGroupResult = wifiMg.createP2pGroup(wifiP2PConfig);
                await sleep(2000);
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
                let removeP2pGroupResult = await wifiMg.removeP2pGroup();
                await sleep(2000);
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed1 :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]createP2pGroup 5G goBand fail : " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0207
        * @tc.name testcreateP2pGroup
        * @tc.desc Test createP2pGroup-Auto frequency band setting Function
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
            expect(wifiMg.isWifiActive()).assertTrue();
            try {
                let wifiP2PConfig = {
                    deviceAddress : "00:00:00:00:00:00",
                    netId : -1,
                    passphrase : "12345678",
                    groupName : "DIRECT-test_band3",
                    goBand : wifiMg.GroupOwnerBand.GO_BAND_AUTO,
                };
                let createP2pGroupResult = wifiMg.createP2pGroup(wifiP2PConfig);
                await sleep(2000);
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test]getCurrentP2pGroup promise result : " + JSON.stringify(data));
                        expect(true).assertEqual(data.frequency != null );
                    });
                let removeP2pGroupResult = await wifiMg.removeP2pGroup();
                await sleep(2000);
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]createP2pGroup auto  goBand result : " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0008
        * @tc.name testcreateP2pGroup
        * @tc.desc Test createP2pGroup-SSID is an empty string Function.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
            expect(wifiMg.isWifiActive()).assertTrue();
            try {
                let wifiP2PConfig = {
                    deviceAddress: "00:00:00:00:00:00",
                    netId: -1,
                    passphrase: "12345678",
                    groupName: "",
                    goBand: wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
                };
                let createP2pGroupResult = wifiMg.createP2pGroup(wifiP2PConfig);
                await sleep(2000);
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test]getCurrentP2pGroup  promise result : " + JSON.stringify(data));
                    });
                let removeP2pGroupResult = wifiMg.removeP2pGroup();
                await sleep(2000);
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]createP2pGroup error passphrase result : " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0108
        * @tc.name testcreateP2pGroup
        * @tc.desc Test createP2pGroup-SSID is a space Function.
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
            expect(wifiMg.isWifiActive()).assertTrue();
            try {
                let wifiP2PConfig = {
                    deviceAddress: "00:00:00:00:00:00",
                    netId: -1,
                    passphrase: "12345678",
                    groupName: " ",
                    goBand: wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
                };
                let createP2pGroupResult = wifiMg.createP2pGroup(wifiP2PConfig);
                await sleep(2000);
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test]getCurrentP2pGroup promise result :" + JSON.stringify(data));
                    });
                let removeP2pGroupResult = wifi.removeP2pGroup();
                await sleep(2000);
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]createP2pGroup error passphrase result : " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
       * @tc.number SUB_Communication_WiFi_XTS_P2P_0308
       * @tc.name testcreateP2pGroup
       * @tc.desc Test createP2pGroup-the password must be a space.
       * @tc.type Function
       * @tc.level Level 0
       */
        it('SUB_Communication_WiFi_XTS_P2P_0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
            expect(wifiMg.isWifiActive()).assertTrue();
            try {
                let wifiP2PConfig = {
                    deviceAddress: "00:00:00:00:00:00",
                    netId: -1,
                    passphrase: " ",
                    groupName: "DIRECT-testpassword",
                    goBand: wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
                };
                let createP2pGroupResult = wifi.createP2pGroup(wifiP2PConfig);
                await sleep(2000);
                await wifi.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result :" + JSON.stringify(data));
                    });
                let removeP2pGroupResult = wifi.removeP2pGroup();
                await sleep(2000);
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]createP2pGroup error passphrase result : " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0009
        * @tc.name testP2pCancelConnect
        * @tc.desc Test p2pCancelConnect Group API functionality.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let DeviceAddressType  = {
                RANDOM_DEVICE_ADDRESS : 0 ,
                REAL_DEVICE_ADDRESS : 1 ,
            };
            let wifiP2PConfig = {
                deviceAddress : "11:22:33:44:55:66",
                deviceAddressType : wifiMg.DeviceAddressType.REAL_DEVICE_ADDRESS,
                netId : -1,
                passphrase : "12345678",
                groupName : "DIRECT-AAAZZZ456",
                goBand : wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
            };
            let p2pConnectResult = wifiMg.p2pConnect(wifiP2PConfig);
            console.info("[wifi_test]test p2pConnect successful." );
            let p2pCancelResult = wifiMg.p2pCancelConnect();
            await sleep(2000);
            console.info("[wifi_test]test p2pCancelConnect successful." );
            try {
                let removeP2pGroupResult = wifiMg.removeP2pGroup();
            }catch(error){
                console.info("[wifi_test]removeP2pGroup  error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0011
        * @tc.name testremoveP2pGroup
        * @tc.desc Test remove a nonexistent group.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_XTS_P2P_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let removeP2pGroupResult = wifiMg.removeP2pGroup(10000);
            }catch(error){
                console.info("[wifi_test]removeP2pGroup error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        console.info("[wifi_test] getCurrentP2pGroup  promise result1 :" + JSON.stringify(data));
                        expect(true).assertEqual(data.deviceName == null);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0002
        * @tc.name testP2pLocalDevice
        * @tc.desc Test get P2pLocalDevice API functionality.
        * @tc.type Function
        * @tc.level Level 3
        * @tc.size: MediumTest
        */
        it('SUB_Communication_WiFi_XTS_P2P_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await wifiMg.getP2pLocalDevice()
                .then(data => {
                    console.info("[wifi_test]getP2pLocalDevice  promise result :" + JSON.stringify(data));
                    expect(true).assertEqual(data.deviceName !=null);
                }).catch((error) => {
                    console.info("[wifi_test]getP2pLocalDevice promise error." + JSON.stringify(error));
                    if (error.code == 801) {
                        console.info('[wifi_js]api is not support');
                        expect(true).assertTrue();
                    } else {
                        expect().assertFail();
                    }
                });
            function getP2pLocal(){
                return new Promise((resolve, reject) => {
                    wifiMg.getP2pLocalDevice(
                        (err, ret) => {
                            if(err) {
                                console.info("[wifi_test]getP2pLocalDevice callback failed : " + JSON.stringify(err));
                                return;
                            }
                            console.info("[wifi_test]getP2pLocalDevice callback result: " + JSON.stringify(ret));
                            console.info("deviceName: " + ret.deviceName + "deviceAddress: " +
                            ret.deviceAddress + "deviceAddressType: " + ret.deviceAddressType + 
                            "primaryDeviceType: " + ret.primaryDeviceType +
                            "deviceStatus: " + ret.deviceStatus + "groupCapabilitys: " +
                            ret.groupCapabilitys );
                            resolve();
                        });
                });
            }
            try {
                await getP2pLocal();
            }catch(error){
                console.info("[wifi_test]getP2pLocalDevice promise error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0010
        * @tc.name testGetP2pLinkedInfo
        * @tc.desc Test getP2pLinkedInfo API functionality
        * @tc.type Function
        * @tc.level Level 2
        */
        it('SUB_Communication_WiFi_XTS_P2P_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            let p2pConnectState = {
                DISCONNECTED :0,
                CONNECTED : 1,
            };
            try {
                await wifiMg.getP2pLinkedInfo()
                .then(data => {
                    let resultLength = Object.keys(data).length;
                    console.info("[wifi_test]getP2pLinkedInfo promise result :" + JSON.stringify(data));
                    expect(true).assertEqual(resultLength!=0);
                    done()
                });
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                }
            }
            function getP2pLinkedInfoResult(){
                return new Promise((resolve, reject) => {
                    wifiMg.getP2pLinkedInfo(
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
            try {
                await getP2pLinkedInfoResult();
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0001
        * @tc.name testGetP2pPeerDevices
        * @tc.desc Test getP2pPeerDevices promise API functionality
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done){
            try {
                console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
                expect(wifiMg.isWifiActive()).assertTrue();
                let startDiscover = wifiMg.startDiscoverP2pDevices();
                await sleep(2000);
                await wifiMg.getP2pPeerDevices()
                    .then((data)  => {
                        let resultLength = Object.keys(data).length;
                        console.info("[wifi_test]getP2pPeerDevices  promise result -> " + JSON.stringify(data));
                        expect(true).assertEqual(resultLength >= 0);
                    }).catch((error) => {
                        console.info("[wifi_test]getP2pPeerDevices promise then error." + JSON.stringify(error));
                        expect().assertFail();
                    });
                let stopDiscover = wifiMg.stopDiscoverP2pDevices();
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                }
            }
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_0101
        * @tc.name testGetP2pPeerDevices
        * @tc.desc Test getP2pPeerDevices callback API functionality
        * @tc.type Function
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done){
            try {
                console.log("[wifi_test]check the state of wifi: " + wifiMg.isWifiActive());
                expect(wifiMg.isWifiActive()).assertTrue();
                let startDiscover = wifiMg.startDiscoverP2pDevices();
                await sleep(2000);
                function getP2pPeerDevicesResult(){
                    return new Promise((resolve, reject) => {
                        wifiMg.getP2pPeerDevices(
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
                                    if(result[j].deviceStatus == wifiMg.P2pDeviceStatus.UNAVAILABLE){
                                        console.info("deviceStatus: " + result[j].deviceStatus);
                                    }
                                    if(result[j].deviceStatus == wifiMg.P2pDeviceStatus.CONNECTED){
                                        console.info("deviceStatus: " + result[j].deviceStatus);
                                    }
                                    if(result[j].deviceStatus == wifiMg.P2pDeviceStatus.INVITED){
                                        console.info("deviceStatus: " + result[j].deviceStatus);
                                    }
                                    if(result[j].deviceStatus == wifiMg.P2pDeviceStatus.FAILED){
                                        console.info("deviceStatus: " + result[j].deviceStatus);
                                    }
                                    if(result[j].deviceStatus == wifiMg.P2pDeviceStatus.AVAILABLE){
                                        console.info("deviceStatus: " + result[j].deviceStatus);
                                    }
                                }
                                resolve();
                            });
                    });
                }
                await getP2pPeerDevicesResult();
            }catch(error){
                console.info("[wifi_test]error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_WifiManager_XTS_P2p_CreateGroup_0100
         * @tc.name testCreateGroup
         * @tc.desc Test createGroup Sync API functionality.
         * @tc.type Function
         * @tc.size:MediumTest
         * @tc.level Level 2
         */
        it('SUB_Communication_WifiManager_XTS_P2p_CreateGroup_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done){
            try {
                wifiMg.createGroup(null);
                expect().assertFail();
	        }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                expect(Number(error.code)).assertEqual(401);
	        }
	        done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_XTS_P2P_P2pConnectState_0100
        * @tc.name testP2pConnectState
        * @tc.desc Test P2pConnectState API functionality
        * @tc.type Function
        * @tc.size: MediumTest
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFi_XTS_P2P_P2pConnectState_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                let DISCONNECTED = wifiMg.P2pConnectState.DISCONNECTED;
                console.info('[wifi_test]P2pConnectState DISCONNECTED:' + JSON.stringify(DISCONNECTED));
                expect(DISCONNECTED).assertEqual(0);

                let CONNECTED = wifiMg.P2pConnectState.CONNECTED;
                console.info('[wifi_test]P2pConnectState CONNECTED:' + JSON.stringify(CONNECTED));
                expect(CONNECTED).assertEqual(1);
            } catch (error) {
                console.error('[wifi_test]P2pConnectState get error:' + JSON.stringify(error));
                expect().assertFail();
              }
              done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}