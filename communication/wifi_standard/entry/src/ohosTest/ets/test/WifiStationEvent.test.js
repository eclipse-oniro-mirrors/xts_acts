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
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

import wifi from '@ohos.wifi'
import wifiext from '@ohos.wifiext'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

function checkWifiPowerOn(){
    console.info("[wifi_test]wifi status:" + wifi.isWifiActive());
}
function resolveIP(ip) {
    return (ip>>24 & 0xFF) + "." + (ip>>16 & 0xFF) + "." + (ip>>8 & 0xFF) + "." + (ip & 0xFF);
}

async function clickRequestPermission() {
    try {
        console.info('[wifi_js] clickRequestPermission start');
        let driver = Driver.create();
        await driver.delayMs(3000);
        let button = await driver.findComponent(ON.text("本次使用", MatchPattern.CONTAINS));
        await button.click();
        await driver.delayMs(3000);
        console.info('[wifi_js] clickRequestPermission end');
    } catch (err) {
        console.info('[wifi_js] clickRequestPermission failed');
    }
}

async function scrollSearchLocation() {
    try {
        console.info('[wifi_js] scrollSearchLocation start');
        let driver = Driver.create();
        await driver.delayMs(2000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'));
        let button = await scrollBar.scrollSearch(ON.type('Toggle'));
        if (button != null) {
            if (await button.isChecked()) {
                console.info('[wifi_js] ohos.permission.LOCATION is open');
                return;
            } else {
                await button.click();
                await driver.delayMs(2000);
                console.info('[wifi_js] scrollSearchLocation end');
            }
        } else {
            console.info('[wifi_js] scrollSearch not find');
            return;
        }
        
    } catch (err) {
        console.info('[wifi_js] scrollSearchLocation failed');
    }
}


export default function actsWifiEventTest() {
    describe('actsWifiEventTest', function() {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await scrollSearchLocation();
            await clickRequestPermission();
            done();
        })

        beforeEach(function () {
            checkWifiPowerOn();
        })
        afterEach(function () {
        })

        /**
        * @tc.number Communication_WiFi_Event_Test_0001
        * @tc.name testWifiStateChange
        * @tc.desc Test wifiStateChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_Event_Test_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "wifiStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiState, wifiStateChangeCallback);
            await sleep(3000);
            wifi.off(wifiState, wifiStateChangeCallback);
            done();
        })

        /**
        * @tc.number Communication_WiFi_Event_Test_0002
        * @tc.name testWifiConnectionChange
        * @tc.desc Test wifiConnectionChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_Event_Test_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiConnectionState = "wifiConnectionChange";
            let wifiConnectionChangeCallback = result => {
                console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiConnectionState, wifiConnectionChangeCallback);
            await sleep(3000);
            wifi.off(wifiConnectionState, wifiConnectionChangeCallback);
            done();
        })

        /**
        * @tc.number Communication_WiFi_Event_Test_0003
        * @tc.name testWifiScanStateChange
        * @tc.desc Test wifiScanStateChange  callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_Event_Test_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiScanState = "wifiScanStateChange";
            let wifiScanStateChangeCallback = result => {
                console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiScanState, wifiScanStateChangeCallback);
            try {
                let scanResult = wifi.scan();
            } catch (error) {
                console.error(`scan failed, code is ${error.code}, message is ${error.message}`);
                expect(true).assertEqual(error !=null);
            }
            await sleep(3000);
            wifi.off(wifiScanState, wifiScanStateChangeCallback);
            done();
        })

        /**
        * @tc.number Communication_WiFi_Event_Test_0004
        * @tc.name testWifiRssiChange
        * @tc.desc Test wifiRssiChange callback
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_Event_Test_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiRssiState = "wifiRssiChange";
            let wifiRssiChangeCallback = result => {
                console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiRssiState, wifiRssiChangeCallback);
            await sleep(3000);
            wifi.off(wifiRssiState, wifiRssiChangeCallback);
            done();
        })

        /**
        * @tc.number Communication_WiFi_Event_Test_0005
        * @tc.name testHotspotStateChange
        * @tc.desc Test hotspotStateChange api.
        * @tc.type Function
        * @tc.level Level 3
        */
        it('Communication_WiFi_Event_Test_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let hotspotState = "hotspotStateChange";
            let hotspotStateChangeCallback = result => {
                console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(hotspotState, hotspotStateChangeCallback);
            await sleep(3000);
            wifi.off(hotspotState, hotspotStateChangeCallback);
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0001
        * @tc.name testenableHotspot
        * @tc.desc Test enableHotspot api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0001 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0001 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] enableHotspot: " + wifiext.enableHotspot())
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0001 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0001 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0002
        * @tc.name testdisableHotspot
        * @tc.desc Test disableHotspot api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0002 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0002 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] disableHotspot: " + wifiext.disableHotspot())
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0002 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0002 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0003
        * @tc.name testgetSupportedPowerModel
        * @tc.desc Test getSupportedPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0003 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0003 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    await wifiext.getSupportedPowerModel()
                        .then(data => {
                            console.info("[wifi_test]getSupportedPowerModel promise result -> " + JSON.stringify(data));
                        });
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0003 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0003 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0004
        * @tc.name testgetSupportedPowerModel
        * @tc.desc Test getSupportedPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0004 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0004 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    function getSupportedPowerModelResult(){
                        return new Promise((resolve, reject) => {
                            wifiext.getSupportedPowerModel(
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
                console.info("SUB_Communication_WiFi_SysCaps_Test_0004 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0004 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0005
        * @tc.name testgetPowerModel
        * @tc.desc Test getPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0005 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0005 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    await wifiext.getPowerModel()
                        .then(data => {
                            console.info("[wifi_test]getPowerModel promise result -> " + JSON.stringify(data));
                        });
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0005 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0005 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0006
        * @tc.name testgetPowerModel
        * @tc.desc Test getPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0006 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0006 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    function getPowerModelResult(){
                        return new Promise((resolve, reject) => {
                            wifiext.getPowerModel(
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
                console.info("SUB_Communication_WiFi_SysCaps_Test_0006 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0006 end');
            done();
        })

        /**
        * @tc.number SUB_Communication_WiFi_SysCaps_Test_0007
        * @tc.name testsetPowerModel
        * @tc.desc Test setPowerModel api.
        * @tc.type Function
        */
        it('SUB_Communication_WiFi_SysCaps_Test_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0007 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0007 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] setPowerModel: " + wifiext.setPowerModel(PowerModel))
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0007 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0007 end');
            let SLEEPING = wifiext.PowerModel.SLEEPING;
            console.info("[wifi_test]SLEEPING : " + JSON.stringify(SLEEPING));
            expect(true).assertEqual( SLEEPING == 0);
            let GENERAL = wifiext.PowerModel.GENERAL;
            console.info("[wifi_test]GENERAL : " + JSON.stringify(GENERAL));
            expect(true).assertEqual( GENERAL == 1);
            let THROUGH = wifiext.PowerModel.THROUGH_WALL;
            console.info("[wifi_test]THROUGH : " + JSON.stringify(THROUGH));
            expect(true).assertEqual( THROUGH == 2);
            done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}

