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
async function checkSavedNet()
{
    let getCandidate = wifiMg.getCandidateConfigs();
    if(getCandidate.length>0)
    {
        for(let i=0;getCandidate.length;i++)
        {
            await wifiMg.removeCandidateConfig(getCandidate[i].netId)
                .then(ret => {
                    console.info("[wifi_test]wifi remove CandidateConfigs result : " + JSON.stringify(ret));
                }).catch((error) => {
                    console.error('[wifi_test]remove CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect().assertFail();
                });
        }
    }
}

async function clickTest() {
      let driver = Driver.create();
      await driver.delayMs(1500);
      try {
          let button = await driver.findComponent(ON.text("取消"));
          await button.click();
          await driver.delayMs(1500);
      } catch (err) {
          console.info('err info: ' + err);
      }
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

export default function actsWifiManagerCandidateNetWorkTest() {
    describe('actsWifiManagerCandidateNetWorkTest', function () {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await scrollSearchLocation();
            await clickRequestPermission();
            done();
        })

        beforeEach(function () {
            checkWifiPowerOn();
        })
        afterEach(async function (done) {
            await clickTest();
            done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0001
         * @tc.name testAddCandidateConfig
         * @tc.desc Test add OPEN and WEP CandidateConfig Promise API functionality.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_OPEN",
                "bssid": "22:9b:e6:48:1f:5c",
                "preSharedKey": "",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
            };
            try {
                await wifiMg.addCandidateConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add OPEN CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId != -1);
                }).catch((error) => {
                    console.error('[wifi_test]add OPEN CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect().assertFail();
                });
            let getCandidateResult = wifiMg.getCandidateConfigs();
            console.info("[wifi_test]wifi get OPEN CandidateConfigs result : " + JSON.stringify(getCandidateResult));
            var networkId = getCandidateResult[0].netId;
            console.info("[wifi_test]wifi get networkId result : " + JSON.stringify(networkId));
            await wifiMg.removeCandidateConfig(networkId)
                .then(ret => {
                    let getCandidate = wifiMg.getCandidateConfigs();
                    console.info("[wifi_test]wifi get CandidateConfigs result : " + JSON.stringify(getCandidate));
                    console.info("[wifi_test]wifi  getconfig.length result : " + JSON.stringify(getCandidate.length));
                    expect(true).assertEqual(getCandidate.length == 0);
                }).catch((error) => {
                    console.error('[wifi_test]remove CandidateConfig promise failed ?' + JSON.stringify(error));
                    expect().assertFail();
                });
            let wifiDeviceConfig1 = {
                "ssid": "TEST_WEP",
                "bssid": "22:9b:e6:48:1f:5c",
                "preSharedKey": "ABCDEF1234",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_WEP,
            };
            await wifiMg.addCandidateConfig(wifiDeviceConfig1)
                .then(netWorkId => {
                    console.info("[wifi_test]add WEP CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId = -1);
                }).catch((error) => {
                    console.error('[wifi_test]add WEP CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect(true).assertEqual( (JSON.stringify(error)) !=null);
                });
            let getCandidateResults = wifiMg.getCandidateConfigs();
            console.info("[wifi_test]wifi get WEP CandidateConfigs result : " + JSON.stringify(getCandidateResults));

            let WIFI_SEC_TYPE_INVALID = wifiMg.WifiSecurityType.WIFI_SEC_TYPE_INVALID;
            console.info("[wifi_test]WIFI_SEC_TYPE_INVALID : " + JSON.stringify(WIFI_SEC_TYPE_INVALID));
            expect(true).assertEqual( WIFI_SEC_TYPE_INVALID == 0);
            let WIFI_SEC_TYPE_EAP = wifiMg.WifiSecurityType.WIFI_SEC_TYPE_EAP;
            console.info("[wifi_test]WIFI_SEC_TYPE_EAP : " + JSON.stringify(WIFI_SEC_TYPE_EAP));
            expect(true).assertEqual( WIFI_SEC_TYPE_EAP == 5);
            let WIFI_SEC_TYPE_EAP_SUITE_B = wifiMg.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B;
            console.info("[wifi_test]WIFI_SEC_TYPE_EAP_SUITE_B : " + JSON.stringify(WIFI_SEC_TYPE_EAP_SUITE_B));
            expect(true).assertEqual( WIFI_SEC_TYPE_EAP_SUITE_B == 6);
            let WIFI_SEC_TYPE_OWE = wifiMg.WifiSecurityType.WIFI_SEC_TYPE_OWE;
            console.info("[wifi_test]WIFI_SEC_TYPE_OWE : " + JSON.stringify(WIFI_SEC_TYPE_OWE));
            expect(true).assertEqual( WIFI_SEC_TYPE_OWE == 7);
            let WIFI_SEC_TYPE_WAPI_CERT = wifiMg.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT;
            console.info("[wifi_test]WIFI_SEC_TYPE_WAPI_CERT : " + JSON.stringify(WIFI_SEC_TYPE_WAPI_CERT));
            expect(true).assertEqual( WIFI_SEC_TYPE_WAPI_CERT == 8);
            let WIFI_SEC_TYPE_WAPI_PSK = wifiMg.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK;
            console.info("[wifi_test]WIFI_SEC_TYPE_WAPI_CERT : " + JSON.stringify(WIFI_SEC_TYPE_WAPI_PSK));
            expect(true).assertEqual( WIFI_SEC_TYPE_WAPI_PSK == 9);
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
         * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0002
         * @tc.name testAddCandidateConfig
         * @tc.desc Test add PSK CandidateConfig and removeCandidateConfig Promise API functionality.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let EapMethod = {
                "wifiMaEAP_NONE": 0,
                "EAP_PEAP": 1,
                "EAP_TLS": 2,
                "EAP_TTLS": 3,
                "EAP_PWD": 4,
                "EAP_SIM": 5,
                "EAP_AKA": 6,
                "EAP_AKA_PRIME": 7,
                "EAP_UNAUTH_TLS": 8,
            };
            let Phase2Method = {
                "PHASE2_NONE": 0,
                "PHASE2_PAP": 1,
                "PHASE2_MSCHAP": 2,
                "PHASE2_MSCHAPV2": 3,
                "PHASE2_GTC": 4,
                "PHASE2_SIM": 5,
                "PHASE2_AKA": 6,
                "PHASE2_AKA_PRIME": 7,
            };
            let WifiEapConfig = {
                "eapMethod": EapMethod.EAP_NONE,
                "phase2Method": Phase2Method.PHASE2_NONE,
                "identity": "aaa",
                "anonymousIdentity": "bbb",
                "password": "12345678",
                "caCertAlias": "ddd",
                "caPath": "eee",
                "clientCertAlias": "fff",
                "certEntry": new Uint8Array(),
                "certPassword": "12345678",
                "altSubjectMatch": "ggg",
                "domainSuffixMatch": "hhh",
                "realm": "iii",
                "plmn": "jjj",
                "eapSubId": "kkk",
            };
            let wifiDeviceConfig = {
                "ssid": "TEST_PSK",
                "bssid": "22:9b:e6:48:1f:5c",
                "bssidType" : 1,
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                "netId": -1,
                "ipType": 1,
                "creatorUid": 7,
                "disableReason": 0,
                "randomMacType": 0,
                "randomMacAddr": "11:22:33:44:55:66",
                "staticIp": {"ipAddress": 1284752956,"gateway": 1284752936},
                "eapConfig": WifiEapConfig,
            };
            try {
                await wifiMg.addCandidateConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add PSK CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId != -1);
                }).catch((error) => {
                    console.error('[wifi_test]add PSK CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect().assertFail();
                });
            let getCandidateResult = wifiMg.getCandidateConfigs();
            console.info("[wifi_test]wifi get PSK CandidateConfigs result : " + JSON.stringify(getCandidateResult));
            var networkId = getCandidateResult[0].netId;
            console.info("[wifi_test]wifi get networkId result : " + JSON.stringify(networkId));
            await wifiMg.removeCandidateConfig(networkId)
                .then(ret => {
                    let getCandidate = wifiMg.getCandidateConfigs();
                    console.info("[wifi_test]wifi get CandidateConfigs result : " + JSON.stringify(getCandidate));
                    console.info("[wifi_test]wifi  getconfig.length result : " + JSON.stringify(getCandidate.length));
                    expect(true).assertEqual(getCandidate.length == 0);
                }).catch((error) => {
                    console.error('[wifi_test]remove CandidateConfig promise failed ?' + JSON.stringify(error));
                    expect().assertFail();
                });
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
         * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0003
         * @tc.name testAddCandidateConfig
         * @tc.desc Test add SAE CandidateConfig Promise API functionality.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_SAE",
                "bssid": "22:9b:e6:48:1f:5c",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_SAE,
            };
            try {
                await wifiMg.addCandidateConfig(wifiDeviceConfig)
                .then(netWorkId => {
                    console.info("[wifi_test]add SAE CandidateConfig promise : " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId != -1);
                }).catch((error) => {
                    console.error('[wifi_js]add SAE CandidateConfig promise failed -> ' + JSON.stringify(error));
                });
            let getCandidateResult = wifiMg.getCandidateConfigs();
            console.info("[wifi_test]wifi get SAE CandidateConfigs result : " + JSON.stringify(getCandidateResult));
            expect(true).assertEqual(getCandidateResult.length>0);
            var networkId = getCandidateResult[0].netId;
            console.info("[wifi_test]wifi get networkId result : " + JSON.stringify(networkId));
            await wifiMg.removeCandidateConfig(networkId)
                .then(ret => {
                    let getconfig1 = wifiMg.getCandidateConfigs();
                    console.info("[wifi_test]wifi get CandidateConfigs result : " + JSON.stringify(getconfig1));
                    console.info("[wifi_test]wifi  getconfig.length result : " + JSON.stringify(getconfig1.length));
                    expect(true).assertEqual(getconfig1.length == 0);
                }).catch((error) => {
                    console.error('[wifi_test]remove CandidateConfig promise failed -> ' + JSON.stringify(error));
                    expect().assertFail();
                });
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
         * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0004
         * @tc.name testAddCandidateConfig
         * @tc.desc Test add MAX CandidateConfig and removeall CandidateConfig.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let SSID = "TYPE_PSK"
                for (let i = 0; i < 16; i++) {
                    SSID = "TYPE_PSK" + i
                    console.info("[wifi_test] get canshu result : ");
                    let wifiDeviceConfig = {
                        "ssid": SSID,
                        "bssid": "22:9b:e6:48:1f:5c",
                        "preSharedKey": "12345678",
                        "isHiddenSsid": false,
                        "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                    };
                    console.info("[wifi_test]get wifiDeviceConfig ssid result : " + JSON.stringify(wifiDeviceConfig.ssid));
                    await wifiMg.addCandidateConfig(wifiDeviceConfig)
                        .then(netWorkId => {
                            console.info("[wifi_test]add 16th CandidateConfig promise : " + JSON.stringify(netWorkId));
                            expect(true).assertEqual(netWorkId != -1);
                        }).catch((error) => {
                            console.error("[wifi_test]add 16th CandidateConfig promise failed "+ JSON.stringify(error));
                            expect().assertFail();
                        });
                }
                let wifiDeviceConfig1 = {
                    "ssid": "TYPE_17",
                    "bssid": "22:9b:e6:48:1f:5c",
                    "preSharedKey": "12345678",
                    "isHiddenSsid": false,
                    "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                };
                await wifiMg.addCandidateConfig(wifiDeviceConfig1)
                    .then(netWorkId => {
                        console.info("[wifi_test]add 17th CandidateConfig promise : " + JSON.stringify(netWorkId));
                        expect(true).assertEqual(netWorkId != -1);
                    }).catch((error) => {
                        console.error(`[wifi_test]add 17th failed, code is ${error.code}, message is ${error.message}`);
                        expect(true).assertEqual( (JSON.stringify(error.message)) !=null);
                    });
                let getCandidateResult = wifiMg.getCandidateConfigs();
                console.info("[wifi_test]wifi get 16 CandidateConfigs result : " + JSON.stringify(getCandidateResult.length));
                for (let i = 0; i < 16; i++) {
                    var networkId = getCandidateResult[i].netId;
                    console.info("[wifi_test]wifi get networkId result : " + JSON.stringify(networkId));
                    await wifiMg.removeCandidateConfig(networkId)
                        .then(ret => {
                            let getconfig1 = wifiMg.getCandidateConfigs();
                            console.info("[wifi_test] wifi get CandidateConfigs result : " + JSON.stringify(getconfig1));
                            console.info("[wifi_test] wifi getconfiglength result : " + JSON.stringify(getconfig1.length));
                        }).catch((error) => {
                            console.error('[wifi_test]remove CandidateConfig promise failed -> ' + JSON.stringify(error));
                        });
                }
                getCandidateResult = wifiMg.getCandidateConfigs();
                expect(true).assertEqual(getCandidateResult.length==0);
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
         * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0005
         * @tc.name testAddCandidateConfig
         * @tc.desc Test add CandidateConfig and removeCandidateConfig callback API functionality.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wapiPskType={
                "WAPI_PSK_ASCII":0,
                "WAPI_PSK_HEX":1,
            }
            let WifiWapiConfig ={
                wapiPskType:wapiPskType.WAPI_PSK_ASCII,
                wapiAsCert:"abc",
                wapiUserCert:"1",
            }
            let wifiDeviceConfig = {
                "ssid": "TEST_connect",
                "bssid": "22:9b:e6:48:1f:5c",
                "preSharedKey": "12345678",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                "wapiConfig":WifiWapiConfig,
            }
            try {
                function addCandidate() {
                    return new Promise((resolve, reject) => {
                        wifiMg.addCandidateConfig(wifiDeviceConfig,
                            (err, netWorkId) => {
                                if (err) {
                                    console.info("[wifi_test]add CandidateConfig callback failed : " + JSON.stringify(err));
                                }
                                console.info("[wifi_test]addCandidateConfig callback result: " + JSON.stringify(netWorkId));
                                expect(true).assertEqual(netWorkId != -1);
                                resolve();
                            });
                    });
                }
                await addCandidate();
                let getCandidateResult = wifiMg.getCandidateConfigs();
                console.info("[wifi_test] wifi getCandidateConfigs result : " + JSON.stringify(getCandidateResult));
                var networkId = getCandidateResult[0].netId;
                function removeCandidate() {
                    return new Promise((resolve, reject) => {
                        wifiMg.removeCandidateConfig(networkId,
                            (err, ret) => {
                                if (err) {
                                    console.info("[wifi_test]removeCandidate callback failed : " + JSON.stringify(err));
                                }
                                let configs1 = wifiMg.getCandidateConfigs();
                                console.info("[wifi_test] wifi get  CandidateConfigs result : " + JSON.stringify(configs1));
                                console.info("[wifi_test] getconfig.length result : " + JSON.stringify(configs1.length));
                                expect(true).assertEqual(configs1.length != null);
                                resolve();
                            });
                    });
                }
                await removeCandidate();
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
         * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0006
         * @tc.name testAddCandidateConfig
         * @tc.desc Test connect To CandidateConfig API functionality.
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 2
         */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                await checkSavedNet();
                let wifiDeviceConfig = {
                    "ssid": "HONOR 3000",
                    "bssid": "22:9b:e6:48:1f:5c",
                    "preSharedKey": "12345678",
                    "isHiddenSsid": false,
                    "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                };
                await wifiMg.addCandidateConfig(wifiDeviceConfig)
                    .then(netWorkId => {
                        console.info("[wifi_test]add CandidateConfig promise : " + JSON.stringify(netWorkId));
                        expect(true).assertEqual(netWorkId != -1);
                    }).catch((error) => {
                        console.error('[wifi_test]add CandidateConfig promise failed -> ' + JSON.stringify(error));
                        expect().assertFail();
                    });
                let getCandidateResult = wifiMg.getCandidateConfigs();
                console.info("[wifi_test]wifi get  CandidateConfigs result : " + JSON.stringify(getCandidateResult));
                let connectToCandidateResult = wifiMg.connectToCandidateConfig(getCandidateResult[0].netId);
                await sleep(3000);
                await wifiMg.getLinkedInfo()
                    .then((result) => {
                        console.info("[wifi_test]get wifi link [promise] -> " + JSON.stringify(result));
                        done();
                    }).catch((error) => {
                        console.info("[wifi_test]promise then error." + JSON.stringify(error));
                        expect().assertFail();
                    });
                let getCandidateResult1 = wifiMg.getCandidateConfigs();
                console.info("[wifi_test]wifi get CandidateConfigs result1 : " + JSON.stringify(getCandidateResult1));
                var networkId = getCandidateResult1[0].netId;
                console.info("[wifi_test]wifi get networkId result : " + JSON.stringify(networkId));
                await wifiMg.removeCandidateConfig(networkId)
                    .then(ret => {
                        let getconfig1 = wifiMg.getCandidateConfigs();
                        console.info("[wifi_test]wifi get CandidateConfigs result : " + JSON.stringify(getconfig1));
                        console.info("[wifi_test]wifi  getconfig.length result : " + JSON.stringify(getconfig1.length));
                        expect(true).assertEqual(getconfig1.length != null);
                    }).catch((error) => {
                        console.error('[wifi_test]remove CandidateConfig promise failed -> ' + JSON.stringify(error));
                        expect().assertFail();
                    });
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
        * @tc.number SUB_Communication_WiFiManager_WapiPskType_0100
        * @tc.name testWapiPskType
        * @tc.desc Test WapiPskType API functionality
        * @tc.type Function
        * @tc.size: MediumTest
        * @tc.level Level 0
        */
        it('SUB_Communication_WiFiManager_WapiPskType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                let WAPI_PSK_ASCII = wifiMg.WapiPskType.WAPI_PSK_ASCII;
                console.info('[wifi_test]WapiPskType WAPI_PSK_ASCII:' + JSON.stringify(WAPI_PSK_ASCII));
                expect(WAPI_PSK_ASCII).assertEqual(0);

                let WAPI_PSK_HEX = wifiMg.WapiPskType.WAPI_PSK_HEX;
                console.info('[wifi_test]WapiPskType WAPI_PSK_HEX:' + JSON.stringify(WAPI_PSK_HEX));
                expect(WAPI_PSK_HEX).assertEqual(1);
            } catch (error) {
                console.error('[wifi_test]WapiPskType get error:' + JSON.stringify(error));
                expect().assertFail();
              }
              done();
        })

        /**
         * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0007
         * @tc.name SUB_Communication_WiFi_XTS_CandidateNetWork_0007
         * @tc.desc Connect to a specified candidate hotspot by networkId, and wait for user respond result
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 0
         */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let wifiDeviceConfig = {
                "ssid": "TEST_TYPE_OPEN",
                "bssid": "22:9b:e6:48:1f:5c",
                "bssidType": wifiMg.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
                "preSharedKey": "",
                "isHiddenSsid": false,
                "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_OPEN
            };
            let notRespond = false;
            let refusedAction = false;
            let apiNotSupport = false;
            let addNetworkId = -99;
            let getNetworkId = -100;
            try {
                await wifiMg.addCandidateConfig(wifiDeviceConfig).then(netWorkId => {
                    console.info("[wifi_test]add OPEN CandidateConfig promise reuslt: " + JSON.stringify(netWorkId));
                    expect(true).assertEqual(netWorkId != -1);
                    addNetworkId = netWorkId;
                });
                let getCandidateResult = wifiMg.getCandidateConfigs();
                console.info("[wifi_test]wifi get OPEN CandidateConfigs result : " + JSON.stringify(getCandidateResult));
                getNetworkId = getCandidateResult[(getCandidateResult.length)-1].netId;
                console.info("[wifi_test]wifi get networkId result : " + JSON.stringify(getNetworkId));
                expect(addNetworkId).assertEqual(getNetworkId);
            }catch(error){
                console.info("[wifi_test] use api get error: " + JSON.stringify(error));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            try {    
                wifiMg.connectToCandidateConfigWithUserAction(getNetworkId).then(result => {
                    console.info("result:" + JSON.stringify(result));
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.error("connectToCandidateConfigWithUserAction get error:" + JSON.stringify(err));
                    if (Number(err.code) == 801) {
                        console.info('[wifi_js]api is not support');
                        expect(true).assertTrue();
                        notRespond = true;
                    } else{
                        expect(Number(err.code)).assertEqual(2501005);
                        notRespond = true;
                    }
                });
                console.info("[wifi_test]sleep start");
                await sleep(11500);
                console.info("[wifi_test]sleep end");
                expect(notRespond).assertTrue();
            
                wifiMg.connectToCandidateConfigWithUserAction(getNetworkId).then(result => {
                    console.info("result:" + JSON.stringify(result));
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.error("connectToCandidateConfigWithUserAction get error:" + JSON.stringify(err));
                    if (Number(err.code) == 801) {
                        console.info('[wifi_js]api is not support');
                        expect(true).assertTrue();
                        refusedAction = true;
                    } else{
                        expect(Number(err.code)).assertEqual(2501006);
                        refusedAction = true;
                    }
                });
                let drivers = Driver.create();
                await drivers.delayMs(900);
                let buttons = await drivers.findComponent(ON.text("取消"));
                await buttons.click();
                await drivers.delayMs(900);
                expect(refusedAction).assertTrue();
            
                wifiMg.connectToCandidateConfigWithUserAction(getNetworkId).then(result => {
                    console.info("result:" + JSON.stringify(result));
                    expect(result).assertTrue();
                    done();
                }).catch((err) => {
                    console.error("connectToCandidateConfigWithUserAction get error:" + JSON.stringify(err));
                    if (Number(err.code) == 801) {
                        console.info('[wifi_js]api is not support');
                        expect(true).assertTrue();
                        apiNotSupport = true;
                    } else{
                        expect().assertFail();
                    }
                });
                if (!apiNotSupport) {
                    let driver = Driver.create();
                    await driver.delayMs(900);
                    let button = await driver.findComponent(ON.text("连接"));
                    await button.click();
                    await driver.delayMs(900);
                }
            }catch(error){
                console.info("[wifi_test] use api get error: " + JSON.stringify(error));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                }
            }
            try {
                await wifiMg.removeCandidateConfig(getNetworkId).then(() => {
                    console.info("[wifi_test]removeCandidateConfig success");
                });
                let getCandidateResults = wifiMg.getCandidateConfigs();
                console.info("[wifi_test]after removeCandidateConfig use getCandidateConfigs: " + JSON.stringify(getCandidateResults));
                console.info("[wifi_test]after removeCandidateConfig use getCandidateConfigs length: " + JSON.stringify(getCandidateResults.length));
                if (getCandidateResults.length != 0) {
                    expect(true).assertEqual(getCandidateResults[(getCandidateResults.length)-1].netId != getNetworkId);
                } else {
                    expect(getCandidateResults.length).assertEqual(0);
                }
                }catch(error){
                    console.info("[wifi_test] use api get error: " + JSON.stringify(error));
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
         * @tc.number SUB_Communication_WiFi_XTS_CandidateNetWork_0008
         * @tc.name SUB_Communication_WiFi_XTS_CandidateNetWork_0008
         * @tc.desc test connectToCandidateConfigWithUserAction result errorCode 2501007
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level 0
         */
        it('SUB_Communication_WiFi_XTS_CandidateNetWork_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await wifiMg.connectToCandidateConfigWithUserAction(-1).then(() => {
                console.info("[wifi_test]connectToCandidateConfigWithUserAction success");
                console.info("[wifi_test]test <Parameter validation failed> fail");
                expect().assertFail();
                done();
            }).catch((error) => {
                console.error('[wifi_test]connectToCandidateConfigWithUserAction Parameter validation failed:' + JSON.stringify(error));
                if (error.code == 801) {
                    console.info('[wifi_js]api is not support');
                    expect(true).assertTrue();
                } else {
                    expect(Number(error.code)).assertEqual(2501007);
                }
            });
            done();
        })
    })
}
