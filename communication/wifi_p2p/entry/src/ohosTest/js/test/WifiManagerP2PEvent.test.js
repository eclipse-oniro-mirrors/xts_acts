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
    console.info("[wifi_test]wifi status:" + wifiMg.isWifiActive());
}

export default function actsWifiManagerEventTest() {
    describe('actsWifiManagerEventTest', function () {
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
         * @tc.name   SUB_Communication_WiFi_Event_Test_0008
         * @tc.number SUB_Communication_WiFi_Event_Test_0008
         * @tc.desc   Test p2pStateChange callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_Event_Test_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let p2pState = "p2pStateChange";
                let p2pStateChangeCallback = result => {
                    console.info("[wifi_test]p2pStateChange callback, result: " + JSON.stringify(result));
                }
                wifiMg.on(p2pState, p2pStateChangeCallback);
                await sleep(3000);
                wifiMg.off(p2pState, p2pStateChangeCallback);
            }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (Number(error.code) == 801) {
                    console.info("api is not support");
                    expect(true).assertTrue();
                }
	        }
	        done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_Event_Test_0009
         * @tc.number SUB_Communication_WiFi_Event_Test_0009
         * @tc.desc   Test p2pConnectionChange callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_Event_Test_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let p2pConnectionState = "p2pConnectionChange";
                let p2pConnectionChangeCallback = result => {
                    console.info("[wifi_test]p2pConnectionChange callback, result: " + JSON.stringify(result));
                }
                wifiMg.on(p2pConnectionState, p2pConnectionChangeCallback);
                let p2pConnectState = {
                    DISCONNECTED :0,
                    CONNECTED : 1,
                };
                let wifiP2PConfig = {
                    deviceAddress : "22:9b:e6:48:1f:5c",
                    deviceAddressType : 1,
                    netId : -1,
                    passphrase : "12345678",
                    groupName : "DIRECT-AAAZZZ456",
                    goBand : wifiMg.GroupOwnerBand.GO_BAND_AUTO,
                    goFreq:2400,
                };
                let connectResult = wifiMg.p2pConnect(wifiP2PConfig);
                let p2pCancelResult = wifiMg.p2pCancelConnect();
                await sleep(2000);
                console.info("[wifi_test]test p2pCancelConnect successful." );
                await wifiMg.getP2pLinkedInfo()
                    .then(data => {
                        let resultLength = Object.keys(data).length;
                        console.info("[wifi_test]getP2pLinkedInfo  promise result : " + JSON.stringify(data));
                        expect(true).assertEqual(resultLength!=0);
                        done()
                    });
                await sleep(2000);
                wifiMg.off(p2pConnectionState, p2pConnectionChangeCallback);
            }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (Number(error.code) == 801) {
                    console.info("api is not support");
                    expect(true).assertTrue();
                }
	        }
	        done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_Event_Test_0012
         * @tc.number SUB_Communication_WiFi_Event_Test_0012
         * @tc.desc   Test p2pDeviceChange callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_Event_Test_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let p2pDeviceState = "p2pDeviceChange";
                let p2pDeviceChangeCallback = result => {
                    console.info("[wifi_test]p2pDeviceChange callback, result: " + JSON.stringify(result));
                }
                wifiMg.on(p2pDeviceState, p2pDeviceChangeCallback);
                await sleep(3000);
                wifiMg.off(p2pDeviceState, p2pDeviceChangeCallback);
            }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (Number(error.code) == 801) {
                    console.info("api is not support");
                    expect(true).assertTrue();
                }
	        }
	        done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_Event_Test_0010
         * @tc.number SUB_Communication_WiFi_Event_Test_0010
         * @tc.desc   Test p2pPeerDeviceChange callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_Event_Test_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let p2pPeerDeviceState = "p2pPeerDeviceChange";
                let p2pPeerDeviceChangeCallback = result => {
                    console.info("[wifi_test]p2pPeerDeviceChange callback, result: " + JSON.stringify(result));
                }
                wifiMg.on(p2pPeerDeviceState, p2pPeerDeviceChangeCallback);
                let startDiscover = wifiMg.startDiscoverP2pDevices();
                await sleep(3000);
                let stopDiscover = wifiMg.stopDiscoverP2pDevices();
                wifiMg.off(p2pPeerDeviceState, p2pPeerDeviceChangeCallback);
            }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (Number(error.code) == 801) {
                    console.info("api is not support");
                    expect(true).assertTrue();
                }
	        }
	        done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_Event_Test_0013
         * @tc.number SUB_Communication_WiFi_Event_Test_0013
         * @tc.desc   Test p2pPersistentGroupChange callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_Event_Test_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let p2pGroupState = "p2pPersistentGroupChange";
            let p2pPersistentGroupChangeCallback = () => {
                console.info("[wifi_test]p2pPersistentGroupChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(p2pGroupState, p2pPersistentGroupChangeCallback);
            let WifiP2PConfig = {
                deviceAddress : "22:9b:e6:48:1f:5c",
                netId : -2,
                passphrase : "12345678",
                groupName : "DIRECT-AAAZZZ123",
                goBand : wifiMg.GroupOwnerBand.GO_BAND_AUTO,
            };
            try {
                await wifiMg.getCurrentP2pGroup()
                    .then(data => {
                        let resultLength = Object.keys(data).length;
                        console.info("[wifi_test] getCurrentP2pGroup  promise result -> " + JSON.stringify(data));
                        expect(true).assertEqual(resultLength!=0);
                    }).catch((error) => {
                        console.error('[wifi_test] getCurrentP2pGroup  promise failed :' + JSON.stringify(error));
                        expect(true).assertEqual(error !=null);
                    });
            }catch(error){
                console.info("[wifi_test] error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
            wifiMg.off(p2pGroupState, p2pPersistentGroupChangeCallback);
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_Event_Test_0007
         * @tc.number SUB_Communication_WiFi_Event_Test_0007
         * @tc.desc   Test createGroup and getCurrentGroup promise and removeGroup
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_Event_Test_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiP2PConfig = {
                deviceAddress: "00:11:22:33:44:55",
                deviceAddressType: wifiMg.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
                netId: -1,
                passphrase : "12345678",
                groupName : "createTemporaryP2pGroup",
                goBand : wifiMg.GroupOwnerBand.GO_BAND_AUTO
            }
            try {
                wifiMg.createGroup(wifiP2PConfig);
                await sleep(900);
            } catch(error) {
                console.info("createGroup: errCode:" + error.code + ",errMessage:" + error.message);
                if (Number(error.code) == 801) {
                    console.info('[wifi_js] createGroup api is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            try {
                await wifiMg.getCurrentGroup().then((wifiP2pGroupInfo) => {
                    console.info("[wifi_js] getCurrentGroup result -> " + JSON.stringify(wifiP2pGroupInfo));
                    expect(true).assertEqual(wifiP2pGroupInfo.length != 0);
                });
            } catch(error) {
                console.info("getCurrentGroup: errCode:" + error.code + ",errMessage:" + error.message);
                if (Number(error.code) == 801) {
                    console.info('[wifi_js] getCurrentGroup api is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            try {
                wifiMg.removeGroup();
            } catch(error) {
                console.info("removeGroup: errCode:" + error.code + ",errMessage:" + error.message);
                if (Number(error.code) == 801) {
                    console.info('[wifi_js] removeGroup api is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_Event_Test_0006
         * @tc.number SUB_Communication_WiFi_Event_Test_0006
         * @tc.desc   Test getCurrentGroup callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_Event_Test_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                function functionGetCurrentGroup() {
                    return new Promise((resolve,reject) => {
                        wifiMg.getCurrentGroup((error) => {
                           if (error) {
                               console.info('[wifi_js] getCurrentGroup callback failed' + JSON.stringify(error));
                               reject(error.code);
                           }
                           resolve();
                       });
                   });
               }
               await functionGetCurrentGroup().then((data) => {
                console.info("[wifi_js] getCurrentGroup callback result:" + JSON.stringify(data));
                })
                .catch(e => {
                    console.info("[wifi_js] getCurrentGroup callback failed" + e);
                    if (Number(e) == 801) {
                        console.info("[wifi_js] api is not support");
                        expect(true).assertTrue();
                    }else {
                        expect().assertFail();
                    }
                })
              } catch (e) {
                console.error(`[wifi_js] getCurrentGroup callback error, error code is: ${e.code}, error message is: ${e.message}`);
              }
              done();
            })

        /**
         * @tc.name   SUB_Communication_WiFi_Event_Test_0005
         * @tc.number SUB_Communication_WiFi_Event_Test_0005
         * @tc.desc   Test startDiscoverDevices and stopDiscoverDevices
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_Event_Test_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                wifiMg.startDiscoverDevices();
                await sleep(900);
            } catch(error) {
                console.info("startDiscoverDevices: errCode:" + error.code + ",errMessage:" + error.message);
                if (Number(error.code) == 801) {
                    console.info('[wifi_js] startDiscoverDevices api is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            try {
                wifiMg.stopDiscoverDevices();
            } catch(error) {
                console.info("stopDiscoverDevices: errCode:" + error.code + ",errMessage:" + error.message);
                if (Number(error.code) == 801) {
                    console.info('[wifi_js] stopDiscoverDevices api is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_Event_Test_0011
         * @tc.number SUB_Communication_WiFi_Event_Test_0011
         * @tc.desc   Test p2pDiscoveryChange callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_Event_Test_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let p2pPeerDeviceState = "p2pDiscoveryChange";
                let p2pDiscoveryChangeCallback = result => {
                    console.info("[wifi_test]p2pDiscoveryChange callback, result: " + JSON.stringify(result));
                }
                wifiMg.on(p2pPeerDeviceState, p2pDiscoveryChangeCallback);
                let startDiscover = wifiMg.startDiscoverP2pDevices();
                await sleep(3000);
                let stopDiscover = wifiMg.stopDiscoverP2pDevices();
                wifiMg.off(p2pPeerDeviceState, p2pDiscoveryChangeCallback);
            }catch(error){
		        console.error("failed:" + JSON.stringify(error));
                if (Number(error.code) == 801) {
                    console.info("api is not support");
                    expect(true).assertTrue();
                }
	        }
	        done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}

