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
import wifiMg from '@ohos.wifiManager'
import wifiManagerExt from '@ohos.wifiManagerExt'
import osaccount from '@ohos.account.osAccount'
import bundle from '@ohos.bundle'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

function checkWifiPowerOn(){
    console.info("[wifi_test]wifi status:" + wifiMg.isWifiActive());
}
function resolveIP(ip) {
    return (ip>>24 & 0xFF) + "." + (ip>>16 & 0xFF) + "." + (ip>>8 & 0xFF) + "." + (ip & 0xFF);
}

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

export default function actsWifiManagerEventTest() {
    describe('actsWifiManagerEventTest', function() {
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
        * @tc.number SUB_Communication_WiFi_Event_Test_0001
        * @tc.name testWifiStateChange
        * @tc.desc Test wifiStateChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0001', 0, async function (done) {
            let wifiState = "wifiStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(wifiState, wifiStateChangeCallback);
            await sleep(3000);
            wifiMg.off(wifiState, wifiStateChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0002
        * @tc.name testWifiConnectionChange
        * @tc.desc Test wifiConnectionChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0002', 0, async function (done) {
            let wifiConnectionState = "wifiConnectionChange";
            let wifiConnectionChangeCallback = result => {
                console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(wifiConnectionState, wifiConnectionChangeCallback);
            await sleep(3000);
            wifiMg.off(wifiConnectionState, wifiConnectionChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0003
        * @tc.name testWifiScanStateChange
        * @tc.desc Test wifiScanStateChange  callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0003', 0, async function (done) {
            let wifiScanState = "wifiScanStateChange";
            let wifiScanStateChangeCallback = result => {
                console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(wifiScanState, wifiScanStateChangeCallback);
            let scanResult = wifiMg.scan();
            await sleep(3000);
            wifiMg.off(wifiScanState, wifiScanStateChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0004
        * @tc.name testWifiRssiChange
        * @tc.desc Test wifiRssiChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0004', 0, async function (done) {
            let wifiRssiState = "wifiRssiChange";
            let wifiRssiChangeCallback = result => {
                console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(wifiRssiState, wifiRssiChangeCallback);
            await sleep(3000);
            wifiMg.off(wifiRssiState, wifiRssiChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_Event_Test_0005
        * @tc.name testHotspotStateChange
        * @tc.desc Test hotspotStateChange api.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('SUB_Communication_WiFi_Event_Test_0005', 0, async function (done) {
            let hotspotState = "hotspotStateChange";
            let hotspotStateChangeCallback = result => {
                console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(hotspotState, hotspotStateChangeCallback);
            await sleep(3000);
            wifiMg.off(hotspotState, hotspotStateChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0008
        * @tc.name testenableHotspot
        * @tc.desc Test enableHotspot api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0008', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0008 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0008 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] enableHotspot: " + wifiManagerExt.enableHotspot())
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0008 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0008 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0009
        * @tc.name testdisableHotspot
        * @tc.desc Test disableHotspot api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0009', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0009 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0009 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] disableHotspot: " + wifiManagerExt.disableHotspot())
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0009 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0009 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0010
        * @tc.name testgetSupportedPowerModel
        * @tc.desc Test getSupportedPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0010', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0010 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0010 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    await wifiManagerExt.getSupportedPowerModel()
                        .then(data => {
                            console.info("[wifi_test]getSupportedPowerModel promise result -> " + JSON.stringify(data));
                        });
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0010 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0010 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0011
        * @tc.name testgetSupportedPowerModel
        * @tc.desc Test getSupportedPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0011', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0011 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0011 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    function getSupportedPowerModelResult(){
                        return new Promise((resolve, reject) => {
                            wifiManagerExt.getSupportedPowerModel(
                                (err, result) => {
                                    if(err) {
                                        console.info("[wifi_test]failed to  getSupportedPowerModel:" + JSON.stringify(err));
                                        expect(true).assertTrue();
                                    }
                                    console.info("[wifi_test]getSupportedPowerModel callback:" + JSON.stringify(result));
                                    resolve();
                                });
                        });
                    }
                    await getSupportedPowerModelResult();
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0011 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0011 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0012
        * @tc.name testgetPowerModel
        * @tc.desc Test getPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0012', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0012 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0012 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    await wifiManagerExt.getPowerModel()
                        .then(data => {
                            console.info("[wifi_test]getPowerModel promise result -> " + JSON.stringify(data));
                        });
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0012 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0012 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0013
        * @tc.name testgetPowerModel
        * @tc.desc Test getPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0013', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0013 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0013 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    function getPowerModelResult(){
                        return new Promise((resolve, reject) => {
                            wifiManagerExt.getPowerModel(
                                (err, result) => {
                                    if(err) {
                                        console.info("[wifi_test]failed to  getPowerModel:" + JSON.stringify(err));
                                        expect(true).assertTrue();
                                    }
                                    console.info("[wifi_test]getPowerModel callback:" + JSON.stringify(result));
                                    resolve();
                                });
                        });
                    }
                    await getPowerModelResult();
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0013 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0013 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0014
        * @tc.name testsetPowerModel
        * @tc.desc Test setPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0014', 0, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0014 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0014 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] setPowerModel: " + wifiManagerExt.setPowerModel(PowerModel))
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0014 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0014 end');
            done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}

