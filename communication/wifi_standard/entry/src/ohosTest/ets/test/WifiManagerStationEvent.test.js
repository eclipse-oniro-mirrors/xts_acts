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

import wifiMg from '@ohos.wifiManager'
import wifiManagerExt from '@ohos.wifiManagerExt'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

function checkWifiPowerOn(){
    console.info("[wifi_test]wifi status:" + wifiMg.isWifiActive());
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

export default function actsWifiManagerEventTest() {
    describe('actsWifiManagerEventTest', function() {
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
         * @tc.number SUB_Communication_WiFi_Event_Test_0001
         * @tc.name testWifiStateChange
         * @tc.desc Test wifiStateChange callback
         * @tc.type Function
         * @tc.level Level 3
         */
        it('SUB_Communication_WiFi_Event_Test_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "wifiStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                await sleep(3000);
                wifiMg.off(wifiState, wifiStateChangeCallback);
            }catch(error){
                console.info("[wifi_test] error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_Event_Test_0002
         * @tc.name testWifiConnectionChange
         * @tc.desc Test wifiConnectionChange callback
         * @tc.type Function
         * @tc.level Level 3
         */
        it('SUB_Communication_WiFi_Event_Test_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiConnectionState = "wifiConnectionChange";
            let wifiConnectionChangeCallback = result => {
                console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiConnectionState, wifiConnectionChangeCallback);
                await sleep(3000);
                wifiMg.off(wifiConnectionState, wifiConnectionChangeCallback);
            }catch(error){
                console.info("[wifi_test] error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_Event_Test_0003
         * @tc.name testWifiScanStateChange
         * @tc.desc Test wifiScanStateChange  callback
         * @tc.type Function
         * @tc.level Level 3
         */
        it('SUB_Communication_WiFi_Event_Test_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiScanState = "wifiScanStateChange";
            let wifiScanStateChangeCallback = result => {
                console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
            }
            wifiMg.on(wifiScanState, wifiScanStateChangeCallback);
            try {
                let scanResult = wifiMg.scan();
            } catch (error) {
                console.error(`scan failed, code is ${error.code}, message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                }
            }
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
        it('SUB_Communication_WiFi_Event_Test_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiRssiState = "wifiRssiChange";
            let wifiRssiChangeCallback = result => {
                console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiRssiState, wifiRssiChangeCallback);
                await sleep(3000);
                wifiMg.off(wifiRssiState, wifiRssiChangeCallback);
            }catch(error){
                console.info("[wifi_test] error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_Event_Test_0005
         * @tc.name testHotspotStateChange
         * @tc.desc Test hotspotStateChange api.
         * @tc.type Function
         * @tc.level Level 3
         */
        it('SUB_Communication_WiFi_Event_Test_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let hotspotState = "hotspotStateChange";
            let hotspotStateChangeCallback = result => {
                console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(hotspotState, hotspotStateChangeCallback);
                await sleep(3000);
                wifiMg.off(hotspotState, hotspotStateChangeCallback);
            }catch(error){
                console.info("[wifi_test] error: " + JSON.stringify(error.message));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0008
         * @tc.name testenableHotspot
         * @tc.desc Test enableHotspot api.
         * @tc.type Function
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                if (e.code == 801) {
                    console.info('[wifi_js]wifiManagerExt enableHotspot is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
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
        it('SUB_Communication_WiFi_SysCaps_Test_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
                if (e.code == 801) {
                    console.info('[wifi_js]wifiManagerExt enableHotspot is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0009 end');
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0010
         * @tc.name testgetSupportedPowerMode
         * @tc.desc Test getSupportedPowerMode api.
         * @tc.type Function
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0010 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0010 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    await wifiManagerExt.getSupportedPowerMode()
                        .then(data => {
                            console.info("[wifi_test]getSupportedPowerMode promise result -> " + JSON.stringify(data));
                        });
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0010 canIUse isAccessToken error: " + e);
                if (e.code == 801) {
                    console.info('[wifi_js]wifiManagerExt enableHotspot is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0010 end');
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0011
         * @tc.name testgetSupportedPowerMode
         * @tc.desc Test getSupportedPowerMode api.
         * @tc.type Function
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0011 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0011 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    function getSupportedPowerModeResult(){
                        return new Promise((resolve, reject) => {
                            wifiManagerExt.getSupportedPowerMode(
                                (err, result) => {
                                    if(err) {
                                        console.info("[wifi_test]failed to  getSupportedPowerMode:" + JSON.stringify(err));
                                        expect(true).assertTrue();
                                    }
                                    console.info("[wifi_test]getSupportedPowerMode callback:" + JSON.stringify(result));
                                    resolve();
                                });
                        });
                    }
                    await getSupportedPowerModeResult();
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0011 canIUse isAccessToken error: " + e);
                if (e.code == 801) {
                    console.info('[wifi_js]wifiManagerExt enableHotspot is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0011 end');
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0012
         * @tc.name testgetPowerMode
         * @tc.desc Test getPowerMode api.
         * @tc.type Function
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0012 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0012 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    await wifiManagerExt.getPowerMode()
                        .then(data => {
                            console.info("[wifi_test]getPowerMode promise result -> " + JSON.stringify(data));
                        });
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0012 canIUse isAccessToken error: " + e);
                if (e.code == 801) {
                    console.info('[wifi_js]wifiManagerExt enableHotspot is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0012 end');
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0013
         * @tc.name testgetPowerMode
         * @tc.desc Test getPowerMode api.
         * @tc.type Function
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0013 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0013 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    function getPowerModeResult(){
                        return new Promise((resolve, reject) => {
                            wifiManagerExt.getPowerMode(
                                (err, result) => {
                                    if(err) {
                                        console.info("[wifi_test]failed to  getPowerMode:" + JSON.stringify(err));
                                        expect(true).assertTrue();
                                    }
                                    console.info("[wifi_test]getPowerMode callback:" + JSON.stringify(result));
                                    resolve();
                                });
                        });
                    }
                    await getPowerModeResult();
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0013 canIUse isAccessToken error: " + e);
                if (e.code == 801) {
                    console.info('[wifi_js]wifiManagerExt enableHotspot is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0013 end');
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0014
         * @tc.name testsetPowerMode
         * @tc.desc Test setPowerMode api.
         * @tc.type Function
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0014 start');
            let ret = false;
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0014 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] setPowerMode: " + wifiManagerExt.setPowerMode(PowerModel))
                    done();
                }
                expect(isAccessToken).assertFalse();
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0014 canIUse isAccessToken error: " + e);
                if (e.code == 801) {
                    console.info('[wifi_js]wifiManagerExt enableHotspot is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0014 end');
            done();
        })

        /**
         * @tc.number SUB_Communication_WifiManagerExt_PowerMode_0100
         * @tc.name testPowerMode
         * @tc.desc Test setPowerMode api.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level0
         */
        it('SUB_Communication_WifiManagerExt_PowerMode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                var isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0014 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    let SLEEPING = wifiManagerExt.PowerMode.SLEEPING;
                console.info('[wifi_test]PowerMode SLEEPING:' + JSON.stringify(SLEEPING));
                expect(SLEEPING).assertEqual(0);
                let GENERAL = wifiManagerExt.PowerMode.GENERAL;
                console.info('[wifi_test]PowerMode GENERAL:' + JSON.stringify(GENERAL));
                expect(GENERAL).assertEqual(1);
                let THROUGH_WALL = wifiManagerExt.PowerMode.THROUGH_WALL;
                console.info('[wifi_test]PowerMode THROUGH_WALL:' + JSON.stringify(THROUGH_WALL));
                expect(THROUGH_WALL).assertEqual(2);
                }
                expect(isAccessToken).assertFalse();
            } catch (error) {
                console.error('[wifi_test]PowerMode get error:' + JSON.stringify(error));
                expect().assertFail();
              }
              done();
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}

