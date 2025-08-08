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

export default function actsWifiCandidateNetWorkTest() {
    describe('actsWifiCandidateNetWorkTest', function () {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await clickRequestPermission();
            done();
        })

        beforeEach(function () {
            checkWifiPowerOn();
        })
        afterEach(function () {
        })

        /**
        * @tc.number Communication_WiFi_XTS_UntrustedConfig_0001
        * @tc.name testaddUntrustedConfig
        * @tc.desc Test add UntrustedConfig and removeUntrustedConfig Promise API functionality.
        * @tc.type Function
        * @tc.level Level 2
        */
        it('Communication_WiFi_XTS_UntrustedConfig_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_PSK",
                "bssid": "22:9b:e6:48:1f:5c",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                "netId": -1,
                "ipType": 1,
                "creatorUid": 7,
                "disableReason": 0,
                "randomMacType": 0,
                "randomMacAddr": "11:22:33:44:55:66",
                "staticIp": {"ipAddress": 1284752956,"gateway": 1284752936}
            };
            await wifi.addUntrustedConfig(wifiDeviceConfig)
                .then(ret => {
                    console.info("[wifi_test]addUntrustedConfig promise : " + JSON.stringify(ret));
                    expect(ret).assertTrue();
                }).catch((error) => {
                    console.error('[wifi_test]addUntrustedConfig promise failed -> ' + JSON.stringify(error));
                });
            await wifi.removeUntrustedConfig(wifiDeviceConfig)
                .then(ret => {
                    console.info("[wifi_test]removeUntrustedConfig promise:" + JSON.stringify(ret));
                    expect(ret).assertTrue();
                }).catch((error) => {
                    console.error('[wifi_test]removeUntrustedConfig promise failed -> ' + JSON.stringify(error));
                });

            let WIFI_SEC_TYPE_INVALID = wifi.WifiSecurityType.WIFI_SEC_TYPE_INVALID;
            console.info("[wifi_test]WIFI_SEC_TYPE_INVALID : " + JSON.stringify(WIFI_SEC_TYPE_INVALID));
            expect(true).assertEqual( WIFI_SEC_TYPE_INVALID == 0);
            let WIFI_SEC_TYPE_OPEN = wifi.WifiSecurityType.WIFI_SEC_TYPE_OPEN;
            console.info("[wifi_test]WIFI_SEC_TYPE_OPEN : " + JSON.stringify(WIFI_SEC_TYPE_OPEN));
            expect(true).assertEqual( WIFI_SEC_TYPE_OPEN == 1);
            let WIFI_SEC_TYPE_WEP = wifi.WifiSecurityType.WIFI_SEC_TYPE_WEP;
            console.info("[wifi_test]WIFI_SEC_TYPE_WEP : " + JSON.stringify(WIFI_SEC_TYPE_WEP));
            expect(true).assertEqual( WIFI_SEC_TYPE_WEP == 2);
            let WIFI_SEC_TYPE_SAE = wifi.WifiSecurityType.WIFI_SEC_TYPE_SAE;
            console.info("[wifi_test]WIFI_SEC_TYPE_SAE : " + JSON.stringify(WIFI_SEC_TYPE_SAE));
            expect(true).assertEqual( WIFI_SEC_TYPE_SAE == 4);
            done();
        })

        /**
        * @tc.number Communication_WiFi_XTS_UntrustedConfig_0002
        * @tc.name testaddUntrustedConfig
        * @tc.desc Test add UntrustedConfig and removeUntrustedConfig callback API functionality.
        * @tc.type Function
        * @tc.level Level 2
        */
        it('Communication_WiFi_XTS_UntrustedConfig_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TYPE_PSK1",
                "bssid": "22:9b:e6:48:1f:5c",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            }
            function addCandidate() {
                return new Promise((resolve, reject) => {
                    wifi.addUntrustedConfig(wifiDeviceConfig,
                        (err, ret) => {
                            if (err) {
                                console.info("[wifi_test]addUntrustedConfig callback failed : " + JSON.stringify(err));
                            }
                            console.info("[wifi_test]addUntrustedConfig callback result: " + JSON.stringify(ret));
                            expect(ret).assertTrue();
                            resolve();
                        });
                });
            }
            await addCandidate();
            function removeCandidate() {
                return new Promise((resolve, reject) => {
                    wifi.removeUntrustedConfig(wifiDeviceConfig,
                        (err, ret) => {
                            if (err) {
                                console.info("[wifi_test]removeUntrustedConfig callback failed" + JSON.stringify(err));
                            }
                            console.info("[wifi_test]removeUntrustedConfig callback result:" + JSON.stringify(ret));
                            expect(ret).assertTrue();
                            resolve();
                        });
                });
            }
            await removeCandidate();
            done();
        })
    })
}

