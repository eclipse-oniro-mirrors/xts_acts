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

export default function actsWifiManagerFunctionsTest() {
    describe('actsWifiManagerFunctionsTest', function() {
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
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0021
         * @tc.name testGetSignalLevel
         * @tc.desc Test getSignalLevel API functionality..
         * @tc.type Function
         * @tc.size LargeTest
         * @tc.level Level 3
         */
        it('SUB_Communication_WiFi_XTS_Sta_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try{
                console.info("[wifi_test] check the 2.4G rssi assgined to level test.");
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-65, 1));
                expect(wifiMg.getSignalLevel(-65, 1)).assertEqual(4);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-66, 1));
                expect(wifiMg.getSignalLevel(-66, 1)).assertEqual(3);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-75, 1));
                expect(wifiMg.getSignalLevel(-75, 1)).assertEqual(3);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-76, 1));
                expect(wifiMg.getSignalLevel(-76, 1)).assertEqual(2);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-82, 1));
                expect(wifiMg.getSignalLevel(-82, 1)).assertEqual(2);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-83, 1));
                expect(wifiMg.getSignalLevel(-83, 1)).assertEqual(1);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-88, 1));
                expect(wifiMg.getSignalLevel(-88, 1)).assertEqual(1);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-89, 1));
                expect(wifiMg.getSignalLevel(-89, 1)).assertEqual(0);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-127, 1));
                expect(wifiMg.getSignalLevel(-127, 1)).assertEqual(0);

                console.info("[wifi_test] check the 5G rssi assgined to level test.");
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-65, 2));
                expect(wifiMg.getSignalLevel(-65, 2)).assertEqual(4);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-66, 2));
                expect(wifiMg.getSignalLevel(-66, 2)).assertEqual(3);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-72, 2));
                expect(wifiMg.getSignalLevel(-72, 2)).assertEqual(3);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-73, 2));
                expect(wifiMg.getSignalLevel(-73, 2)).assertEqual(2);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-79, 2));
                expect(wifiMg.getSignalLevel(-79, 2)).assertEqual(2);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-80, 2));
                expect(wifiMg.getSignalLevel(-80, 2)).assertEqual(1);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-85, 2));
                expect(wifiMg.getSignalLevel(-85, 2)).assertEqual(1);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-86, 2));
                expect(wifiMg.getSignalLevel(-86, 2)).assertEqual(0);
                console.info("[wifi_test] getSignalLevel " + wifiMg.getSignalLevel(-127, 2));
                expect(wifiMg.getSignalLevel(-127, 2)).assertEqual(0);
            } catch(error) {
                console.info("getSignalLevel: errCode:" + error.code + ",errMessage:" + error.message);
                if (Number(error.code) == 801) {
                    console.info("getSignalLevel is not support");
                    expect(true).assertTrue();
                }else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0017
         * @tc.name testgetCountryCode
         * @tc.desc Test getCountryCode API function.
         * @tc.type Function
         * @tc.size LargeTest
         * @tc.level Level 3
         */
        it('SUB_Communication_WiFi_XTS_Sta_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            expect(wifiMg.isWifiActive()).assertTrue();
            try {
                let getCountryCodeResult = wifiMg.getCountryCode();
                console.info("[wifi_test]getCountryCode :" + JSON.stringify(getCountryCodeResult));
                let countrylenth = getCountryCodeResult.length;
                console.info("[wifi_test]getCountryCode.length :" + JSON.stringify(countrylenth));
                expect(true).assertEqual(countrylenth == 2);
                let WIDTH_20MHZ = wifiMg.WifiChannelWidth .WIDTH_20MHZ;
                console.info("[wifi_test]WIDTH_20MHZ : " + JSON.stringify(WIDTH_20MHZ));
                expect(true).assertEqual( WIDTH_20MHZ == 0);
                let WIDTH_40MHZ = wifiMg.WifiChannelWidth .WIDTH_40MHZ;
                console.info("[wifi_test]WIDTH_40MHZ : " + JSON.stringify(WIDTH_40MHZ));
                expect(true).assertEqual( WIDTH_40MHZ == 1);
                let WIDTH_80MHZ = wifiMg.WifiChannelWidth .WIDTH_80MHZ;
                console.info("[wifi_test]WIDTH_80MHZ : " + JSON.stringify(WIDTH_80MHZ));
                expect(true).assertEqual( WIDTH_80MHZ == 2);
                let WIDTH_160MHZ = wifiMg.WifiChannelWidth .WIDTH_160MHZ;
                console.info("[wifi_test]WIDTH_160MHZ : " + JSON.stringify(WIDTH_160MHZ));
                expect(true).assertEqual( WIDTH_160MHZ == 3);
                let WIDTH_80MHZ_PLUS = wifiMg.WifiChannelWidth .WIDTH_80MHZ_PLUS;
                console.info("[wifi_test]WIDTH_80MHZ_PLUS : " + JSON.stringify(WIDTH_80MHZ_PLUS));
                expect(true).assertEqual( WIDTH_80MHZ_PLUS == 4);
                let WIDTH_INVALID = wifiMg.WifiChannelWidth .WIDTH_INVALID;
                console.info("[wifi_test]WIDTH_INVALID : " + JSON.stringify(WIDTH_INVALID));
                expect(true).assertEqual( WIDTH_INVALID == 5);
            } catch(error) {
                console.info("getCountryCode: errCode:" + error.code + ",errMessage:" + error.message);
                if (Number(error.code) == 801) {
                    console.info("getCountryCode is not support");
                    expect(true).assertTrue();
                }else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0020
         * @tc.name testFeatureSupported
         * @tc.desc Test FeatureSupported API function.
         * @tc.type Function
         * @tc.size LargeTest
         * @tc.level Level 3
         */
        it('SUB_Communication_WiFi_XTS_Sta_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            expect(wifiMg.isWifiActive()).assertTrue();
            let wifiUtils = {
                WIFI_FEATURE_INFRA: 0x0001,
                WIFI_FEATURE_INFRA_5G: 0x0002,
                WIFI_GAS_ANQP: 0x0004,
                WIFI_WIFI_DIRECT: 0x0008,
                WIFI_FEATURE_MOBILE_HOTSPOT: 0x0010,
                WIFI_FEATURE_AWARE: 0x0040,
                WIFI_FEATURE_AP_STA: 0x8000,
                WIFI_FEATURE_WPA3_SAE: 0x8000000,
                WIFI_FEATURE_WPA3_SUITE_B: 0x10000000,
                WIFI_FEATURE_OWE: 0x20000000
            }
            try {
                let isSupport1 = wifiMg.isFeatureSupported(wifiUtils.WIFI_FEATURE_INFRA);
                console.info("[wifi_test] isFeatureSupported -> " + isSupport1);
                let isSupport2 = wifiMg.isFeatureSupported(wifiUtils.WIFI_FEATURE_INFRA_5G);
                console.info("[wifi_test] isFeatureSupported2 -> " + isSupport2);
                let isSupport3 = wifiMg.isFeatureSupported(wifiUtils.WIFI_GAS_ANQP);
                console.info("[wifi_test] isFeatureSupported3 -> " + isSupport3);
                let isSupport4 = wifiMg.isFeatureSupported(wifiUtils.WIFI_WIFI_DIRECT);
                console.info("[wifi_test] isFeatureSupported4 -> " + isSupport4);
                let isSupport5 = wifiMg.isFeatureSupported(wifiUtils.WIFI_FEATURE_MOBILE_HOTSPOT);
                console.info("[wifi_test] isFeatureSupported5 -> " + isSupport5);
                let isSupport6 = wifiMg.isFeatureSupported(wifiUtils.WIFI_FEATURE_AWARE);
                console.info("[wifi_test] isFeatureSupported6 -> " + isSupport6);
                let isSupport7 = wifiMg.isFeatureSupported(wifiUtils.WIFI_FEATURE_AP_STA);
                console.info("[wifi_test] isFeatureSupported7 -> " + isSupport7);
                let isSupport8 = wifiMg.isFeatureSupported(wifiUtils.WIFI_FEATURE_WPA3_SAE);
                console.info("[wifi_test] isFeatureSupported8 -> " + isSupport8);
                let isSupport9 = wifiMg.isFeatureSupported(wifiUtils.WIFI_FEATURE_WPA3_SUITE_B);
                console.info("[wifi_test] isFeatureSupported9 -> " + isSupport9);
                let isSupport = wifiMg.isFeatureSupported(wifiUtils.WIFI_FEATURE_OWE);
                console.info("[wifi_test] isFeatureSupported -> " + isSupport);
            } catch(error) {
                console.info("isFeatureSupported: errCode:" + error.code + ",errMessage:" + error.message);
                if (Number(error.code) == 801) {
                    console.info("isFeatureSupported is not support");
                    expect(true).assertTrue();
                }else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0004
         * @tc.name testGetLinkedInfo
         * @tc.desc Test Test getLinkedInfo and getIpInfo  information.
         * @tc.type Function
         * @tc.size LargeTest
         * @tc.level Level 1
         */
        it('SUB_Communication_WiFi_XTS_Sta_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let isConnectedResult = wifiMg.isConnected();
            let ipInfoResult = wifiMg.getIpInfo();
            expect(JSON.stringify(ipInfoResult)).assertContain("gateway");
            let ipAddress = resolveIP(ipInfoResult.ipAddress);
            console.info("[wifi_test]ipAddress result: " + ipAddress);
            console.info("gateway: " + ipInfoResult.gateway + "ipAddress: " + ipInfoResult.ipAddress
                + "leaseDuration: " + ipInfoResult.leaseDuration +
                "leaseDuration: " + ipInfoResult.leaseDuration +
                "netmask: " + ipInfoResult.netmask + "primaryDns:" + ipInfoResult.primaryDns +
                "secondDns: " + ipInfoResult.secondDns + "serverIp: " + ipInfoResult.serverIp);
            await wifiMg.getLinkedInfo()
                .then((result) => {
                    console.info("[wifi_test]get wifi link promise:" + JSON.stringify(result));
                    done();
                }).catch((error) => {
                    console.info("[wifi_test]promise then error." + JSON.stringify(error));
                    if (error.code == 801) {
                        console.info('[wifi_js]api is not support');
                        expect(true).assertTrue();
                    } else {
                        expect().assertFail();
                    } 
                });
            function getLinked(){
                return new Promise((resolve, reject) => {
                    wifiMg.getLinkedInfo(
                        (err, result) => {
                            if(err) {
                                console.log("[wifi_test]wifi getLinkedInfo failed " + err);
                            }
                            let clen = Object.keys(result).length;
                            expect(clen).assertLarger(0);
                            console.info("[wifi_test]getLinkedInfo callback result: " + JSON.stringify(result));
                            console.info("ssid: " + result.ssid + "bssid:" + result.bssid + "band: " + result.band +
                                "isHidden: " + result.isHidden + "isRestricted: " + result.isRestricted +
                                "chload: " + result.chload + "rssi " + result.rssi + "netWorkId: " + result.netWorkId +
                                "linkSpeed: " + result.linkSpeed + "frequency:"
                                + result.frequency + "snr:" + result.snr +
                                "macAddress: " + result.macAddress + "ipAddress: " + result.ipAddress +
                                "suppState: " + result.suppState + "connState: " + result.connState
                                + "macType: " + result.macType + "rxLinkSpeed: " + result.rxLinkSpeed
                                + "maxSupportedTxLinkSpeed: " + result.maxSupportedTxLinkSpeed
                                + "maxSupportedRxLinkSpeed: " + result.maxSupportedRxLinkSpeed
                                + "wifiStandard: " + result.wifiStandard
                                + " supportedWifiCategory :"+result.supportedWifiCategory
                                + " isHiLinkNetwork: "+result.isHiLinkNetwork);
                            let standard = wifiMg.getLinkedInfo().WifiStandard;
                            if (standard == wifiMg.WifiStandard.WIFI_STANDARD_UNDEFINED) {
                                expect(true).assertEqual(standard == 0);
                            }
                            if (standard == wifiMg.WifiStandard.WIFI_STANDARD_11A) {
                                expect(true).assertEqual(standard == 1);
                            }
                            if (standard == wifiMg.WifiStandard.WIFI_STANDARD_11B) {
                                expect(true).assertEqual(standard == 2);
                            }
                            if (standard == wifiMg.WifiStandard.WIFI_STANDARD_11G) {
                                expect(true).assertEqual(standard == 3);
                            }
                            if (standard == wifiMg.WifiStandard.WIFI_STANDARD_11N) {
                                expect(true).assertEqual(standard == 4);
                            }
                            if (standard == wifiMg.WifiStandard.WIFI_STANDARD_11AC) {
                                expect(true).assertEqual(standard == 5);
                            }
                            if (standard == wifiMg.WifiStandard.WIFI_STANDARD_11AX) {
                                expect(true).assertEqual(standard == 6);
                            }
                            if (standard == wifiMg.WifiStandard.WIFI_STANDARD_11AD) {
                                expect(true).assertEqual(standard == 7);
                            }
                            let state = wifiMg.getLinkedInfo().ConnState;
                            if (state == wifiMg.ConnState.SCANNING) {
                                expect(true).assertEqual(state == 0);
                            }
                            if (state == wifiMg.ConnState.CONNECTING) {
                                expect(true).assertEqual(state == 1);
                            }
                            if (state == wifiMg.ConnState.AUTHENTICATING) {
                                expect(true).assertEqual(state == 2);
                            }
                            if (state == wifiMg.ConnState.OBTAINING_IPADDR) {
                                expect(true).assertEqual(state == 3);
                            }
                            if (state == wifiMg.ConnState.CONNECTED) {
                                expect(true).assertEqual(state == 4);
                            }
                            if (state == wifiMg.ConnState.DISCONNECTING) {
                                expect(true).assertEqual(state == 5);
                            }
                            if (state == wifiMg.ConnState.DISCONNECTED) {
                                expect(true).assertEqual(state == 6);
                            }
                            if (state == wifiMg.ConnState.UNKNOWN) {
                                expect(true).assertEqual(state == 7);
                            }
                            resolve();
                        });
                });
            }try {
                await getLinked();
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
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0034
         * @tc.name testgetScanResultsSync
         * @tc.desc Test getScanResults Sync API functionality.
         * @tc.type Function
         * @tc.size LargeTest
         * @tc.level Level 0
         */
        it('SUB_Communication_WiFi_XTS_Sta_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try
            {
                let scanResult = wifiMg.scan();
            }catch(error){
                console.info("[error] it's the scan fail reason: "+JSON.stringify(error));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(true).assertEqual(error.code=='2501000');
                } 
            }
            await sleep(3000);
            let getScanInfoListResult = wifiMg.getScanResultsSync();
            let clen = Object.keys(getScanInfoListResult).length;
            console.info("[wifi_test]wifi getScanInfoListResult length  result : " + JSON.stringify(clen));
            let getScanInfoResult = wifiMg.getScanInfoList();
            console.info("[wifi_test]wifi getScanInfoList  result : " + JSON.stringify(getScanInfoResult));
            clen = Object.keys(getScanInfoResult).length;
            console.info("[wifi_test]wifi getScanInfoList length  result : " + JSON.stringify(clen));
            let result = getScanInfoListResult;
            if (clen >= 0) {
                expect(true).assertEqual(clen >= 0);
                for (let j = 0; j < clen && j<3; ++j) {
                    console.info("ssid: " + result[j].ssid + "bssid: " + result[j].bssid + 
                        "bssidType: " + result[j].bssidType +
                        "securityType: " + result[j].securityType +
                        "rssi: " + result[j].rssi + "band: " + result[j].band +
                        "frequency: " + result[j].frequency + "channelWidth: " + result[j].channelWidth +
                        "timestamp" + result[j].timestamp + "capabilities" + result[j].capabilities
                        + "centerFrequency0: " + result[j].centerFrequency0
                        + "centerFrequency1: " + result[j].centerFrequency1
                        + "eid: " + result[j].infoElems.eid + "content: " + result[j].infoElems.content
                        +" supportedWifiCategory: "+result[j].supportedWifiCategory+" isHiLinkNetwork: "+result[j].isHiLinkNetwork);
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0035
         * @tc.name testisBandTypeSupported
         * @tc.desc Test isBandTypeSupported API functionality.
         * @tc.type Function
         * @tc.size LargeTest
         * @tc.level Level 0
         */
        it('SUB_Communication_WiFi_XTS_Sta_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                let isBandTypeSupported = wifiMg.isBandTypeSupported(wifiMg.WifiBandType.WIFI_BAND_NONE);
                console.info("[wifi_test]isBandTypeSupported." + JSON.stringify(isBandTypeSupported));
            } catch (error) {
                console.error(`isBandTypeSupported failed, code is ${error.code}, message is ${error.message}`);
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(error.code).assertEqual("401");
                }     
            }
            let isBandTypeSupported1 = wifiMg.isBandTypeSupported(wifiMg.WifiBandType.WIFI_BAND_2G);
            console.info("[wifi_test]isBandTypeSupported1." + JSON.stringify(isBandTypeSupported1));
            expect(typeof (isBandTypeSupported1)).assertEqual('boolean');
            let isBandTypeSupported2 = wifiMg.isBandTypeSupported(wifiMg.WifiBandType.WIFI_BAND_5G);
            console.info("[wifi_test]isBandTypeSupported2." + JSON.stringify(isBandTypeSupported2));
            expect(typeof (isBandTypeSupported2)).assertEqual('boolean');
            let isBandTypeSupported3 = wifiMg.isBandTypeSupported(wifiMg.WifiBandType.WIFI_BAND_6G);
            console.info("[wifi_test]isBandTypeSupported3." + JSON.stringify(isBandTypeSupported3));
            expect(typeof (isBandTypeSupported3)).assertEqual('boolean');
            let isBandTypeSupported4 = wifiMg.isBandTypeSupported(wifiMg.WifiBandType.WIFI_BAND_60G);
            console.info("[wifi_test]isBandTypeSupported4." + JSON.stringify(isBandTypeSupported4));
            expect(typeof (isBandTypeSupported4)).assertEqual('boolean');
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_Sta_0036
         * @tc.name testgetScanResults
         * @tc.desc Test getScanResults promise and callback API functionality.
         * @tc.type Function
         * @tc.size LargeTest
         * @tc.level Level 0
         */
        it('SUB_Communication_WiFi_XTS_Sta_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                await wifiMg.getScanResults()
                .then(result => {
                    let clen = Object.keys(result).length;
                    expect(true).assertEqual(clen >= 0);
                    console.info("[wifi_test]getScanResults promise result:" + JSON.stringify(result));
                });
            function getScan() {
                return new Promise((resolve, reject) => {
                    wifiMg.getScanResults(
                        (err, result) => {
                            if (err) {
                                console.log("[wifi_test] wifi getScanResults failed:" + err);
                            }
                            let clen = Object.keys(result).length;
                            if (!(clen == 0)) {
                                expect(clen).assertLarger(0);
                                console.info("[wifi_test] getScanResults callback result: " + JSON.stringify(result));
                                for (let j = 0; j < clen; ++j) {
                                    console.info("ssid: " + result[j].ssid + "bssid: " + result[j].bssid +
                                        "securityType: " + result[j].securityType +
                                        "rssi: " + result[j].rssi + "band: " + result[j].band +
                                        "frequency: " + result[j].frequency + "channelWidth: " +
                                        result[j].channelWidth +
                                        "timestamp" + result[j].timestamp + "capabilities" + result[j].capabilities);
                                }
                            }
                            resolve();
                        });
                });
            }
            await getScan();
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
        * @tc.number Communication_WiFi_XTS_Sta_0037
        * @tc.name testgetIpv6Info
        * @tc.desc Test getIpv6Info API functionality.
        * @tc.type Function
        * @tc.size LargeTest
        * @tc.level Level 0
        */
         it('Communication_WiFi_XTS_Sta_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let ipv6InfoResult = wifiMg.getIpv6Info();
                console.info("[wifi_test]ipv6InfoResult." + JSON.stringify(ipv6InfoResult));
                expect(JSON.stringify(ipv6InfoResult)).assertContain("gateway");
                console.info("linkIpv6Address: " + ipv6InfoResult.linkIpv6Address + "globalIpv6Address: " +
                ipv6InfoResult.globalIpv6Address
                + "randomGlobalIpv6Address: " + ipv6InfoResult.randomGlobalIpv6Address +
                "gateway: " + ipv6InfoResult.gateway +
                "netmask: " + ipv6InfoResult.netmask + "primaryDns:" + ipv6InfoResult.primaryDNS +
                "secondDns: " + ipv6InfoResult.secondDNS + "uniqueIpv6Address" + ipv6InfoResult.uniqueIpv6Address +
                "randomUniqueIpv6Address" + ipv6InfoResult.randomUniqueIpv6Address);
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
        * @tc.number Communication_WiFi_XTS_Sta_0099
        * @tc.name testWifiCategory
        * @tc.desc Test enum WifiCategory API12.
        * @tc.type Function
        * @tc.size LargeTest
        * @tc.level Level 0
        */
        it('Communication_WiFi_XTS_Sta_0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            try {
                let WifiCategoryDefault = wifiMg.WifiCategory.DEFAULT;
                console.info("[wifi_test]DEFAULT: " + JSON.stringify(WifiCategoryDefault));
                expect(WifiCategoryDefault).assertEqual(1);
                let WifiCategoryWifi6 = wifiMg.WifiCategory.WIFI6;
                console.info("[wifi_test]WIFI6: " + JSON.stringify(WifiCategoryWifi6));
                expect(WifiCategoryWifi6).assertEqual(2);
                let WifiCategoryWifi6Plus = wifiMg.WifiCategory.WIFI6_PLUS;
                console.info("[wifi_test]WIFI6_PLUS: " + JSON.stringify(WifiCategoryWifi6Plus));
                expect(WifiCategoryWifi6Plus).assertEqual(3);

                let WifiCategoryWifi7 = wifiMg.WifiCategory.WIFI7;
                console.info("[wifi_test]WIFI7: " + JSON.stringify(WifiCategoryWifi7));
                expect(WifiCategoryWifi7).assertEqual(4);
                let WifiCategoryWifi7Plus = wifiMg.WifiCategory.WIFI7_PLUS;
                console.info("[wifi_test]WIFI7_PLUS: " + JSON.stringify(WifiCategoryWifi7Plus));
                expect(WifiCategoryWifi7Plus).assertEqual(5);
            } catch (error) {
                console.error('[wifi_test]testWifiCategory failed: ' + error);
                expect(false).assertTrue();
            }
        })
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}
