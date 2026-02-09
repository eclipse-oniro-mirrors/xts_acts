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
 * See the License for the s*pecific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium";

import wifi from '@ohos.wifi'
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

function resolveIP(ip) {
    return (ip>>24 & 0xFF) + "." + (ip>>16 & 0xFF) + "." + (ip>>8 & 0xFF) + "." + (ip & 0xFF);
}

export default function actsWifiErrorCode201Test() {
    describe('actsWifiErrorCode201Test', function() {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await applyPermission();
            done();
        })

        beforeEach(function () {
        })
        afterEach(function () {
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0003
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0003
         * @tc.desc   Test scan API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                let sacnResult = wifiMg.scan();
                expect().assertFail();
            } catch(error) {
                console.error(`scan failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0038
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0038
         * @tc.desc   Test getScanInfoList API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            try {
                let getScanInfo = wifiMg.getScanInfoList();
                expect().assertFail();
            } catch(error) {
                console.error(`getScanInfoList failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0039
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0039
         * @tc.desc   Test addCandidateConfig API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            (async () => {
                try {
                    let wifiDeviceConfig = {
                        "ssid": "TEST_PSK",
                        "bssid": "22:9b:e6:48:1f:5c",
                        "preSharedKey": "12345678",
                        "isHiddenSsid": false,
                        "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                    };
                    let result = await wifiMg.addCandidateConfig(wifiDeviceConfig)
                    console.info("[wifi_test] addCandidateConfig  promise successful :" + JSON.stringify(result));
                    expect().assertFail();
                } catch(error) {
                    console.error(`addCandidateConfig promise failed, code ${error.code}, message ${error.message}`);
                    expect(error.code).assertEqual("201")
                }
            })();
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0040
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0040
         * @tc.desc   Test addCandidateConfig API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let wifiDeviceConfig = {
                    "ssid": "TEST_PSK",
                    "bssid": "22:9b:e6:48:1f:5c",
                    "preSharedKey": "12345678",
                    "isHiddenSsid": false,
                    "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
                };
                wifiMg.addCandidateConfig(wifiDeviceConfig,
                    (error,data) => {
                        if (error) {
                            console.error(`addCandidateConfig callback,code ${error.code}, message ${error.message}`);
                            expect(error.code).assertEqual("201")
                            return;
                        }
                        console.info("[wifi_test] addCandidateConfig callback result: " + JSON.stringify(data));
                        expect().assertFail();
                    });
            } catch (error) {
                console.error(`addCandidateConfig failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0041
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0041
         * @tc.desc   Test removeCandidateConfig API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            (async () => {
                try {
                    let result = await wifiMg.removeCandidateConfig(0);
                    console.info("[wifi_test] removeCandidateConfig  promise successful :" + JSON.stringify(result));
                    expect().assertFail();
                } catch(error) {
                    console.error(`removeCandidateConfig promise failed, code ${error.code}, message ${error.message}`);
                    expect(error.code).assertEqual("201")
                }
            })();
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0042
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0042
         * @tc.desc   Test removeCandidateConfig API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                wifiMg.removeCandidateConfig(0,
                    (error,data) => {
                        if (error) {
                            console.error(`removeCandidateConf callback,code ${error.code}, message ${error.message}`);
                            expect(error.code).assertEqual("201")
                            return;
                        }
                        console.info("[wifi_test] removeCandidateConfig callback result: " + JSON.stringify(data));
                        expect().assertFail();
                    });
            } catch (error) {
                console.error(`removeCandidateConfig failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0043
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0043
         * @tc.desc   Test getCandidateConfigs API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let getCandidateConfigs = wifiMg.getCandidateConfigs();
                expect().assertFail();
            } catch (error) {
                console.error(`getCandidateConfigs failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0044
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0044
         * @tc.desc   Test connectToCandidateConfig API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let connectToCandidateConfig = wifiMg.connectToCandidateConfig(0);
                expect().assertFail();
            } catch (error) {
                console.error(`connectToCandidateConfig failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0045
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0045
         * @tc.desc   Test getSignalLevel API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let getSignalLevel = wifiMg.getSignalLevel(-65,1);
                expect().assertFail();
            } catch (error) {
                console.error(`getSignalLevel failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0046
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0046
         * @tc.desc   Test getLinkedInfo API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            (async () => {
                try {
                    let result = await wifiMg.getLinkedInfo();
                    console.info("[wifi_test] getLinkedInfo  promise successful :" + JSON.stringify(result));
                    expect().assertFail();
                } catch(error) {
                    console.error(`getLinkedInfo promise failed, code is ${error.code}, message is ${error.message}`);
                    expect(error.code).assertEqual("201")
                }
            })();
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0047
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0047
         * @tc.desc   Test getLinkedInfo API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                wifiMg.getLinkedInfo(
                    (error,data) => {
                        if (error) {
                            console.error(`getLinkedInfo callback,code ${error.code}, message ${error.message}`);
                            expect(error.code).assertEqual("201")
                            return;
                        }
                        console.info("[wifi_test] getLinkedInfo callback result: " + JSON.stringify(data));
                        expect().assertFail();
                    });
            } catch (error) {
                console.error(`getLinkedInfo failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0048
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0048
         * @tc.desc   Test isConnected API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let isConnected = wifiMg.isConnected();
                expect().assertFail();
            } catch (error) {
                console.error(`isConnected failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0049
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0049
         * @tc.desc   Test isFeatureSupported API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let isFeatureSupport = wifiMg.isFeatureSupported(0);
                expect().assertFail();
            } catch (error) {
                console.error(`isFeatureSupported failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0050
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0050
         * @tc.desc   Test getIpInfo API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let getIpInfo = wifiMg.getIpInfo();
                expect().assertFail();
            } catch (error) {
                console.error(`getIpInfo failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0051
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0051
         * @tc.desc   Test getCountryCode API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let getCountryCode = wifiMg.getCountryCode();
                expect().assertFail();
            } catch (error) {
                console.error(`getCountryCode failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0052
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0052
         * @tc.desc   Test getP2pLinkedInfo API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            (async () => {
                try {
                    let result = await wifiMg.getP2pLinkedInfo();
                    await sleep(3000);
                    console.info("[wifi_test] getP2pLinkedInfo  promise successful :" + JSON.stringify(result));
                    expect().assertFail();
                } catch(error) {
                    console.error(`[wifi_test] getP2pLinkedInfo promise ,code ${error.code}, message ${error.message}`);
                    expect(error.code).assertEqual("201")
                }
            })();
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0053
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0053
         * @tc.desc   Test getP2pLinkedInfo API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                wifiMg.getP2pLinkedInfo(
                    (error,data) => {
                        if (error) {
                            sleep(3000);
                            console.error(`[wifi_test] getP2pLinkedInfo,code ${error.code}, message ${error.message}`);
                            expect(error.code).assertEqual("201")
                            return;
                        }
                        console.info("[wifi_test] getP2pLinkedInfo callback result: " + JSON.stringify(data));
                        expect().assertFail();
                    });
            } catch (error) {
                console.error(`getP2pLinkedInfo failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0054
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0054
         * @tc.desc   Test getCurrentP2pGroup API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            (async () => {
                try {
                    let result = await wifiMg.getCurrentP2pGroup();
                    console.info("[wifi_test] getCurrentP2pGroup  promise successful :" + JSON.stringify(result));
                    expect().assertFail();
                } catch(error) {
                    console.error(`getCurrentP2pGroup promise failed, code ${error.code}, message ${error.message}`);
                    expect(error.code).assertEqual("201")
                }
            })();
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0055
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0055
         * @tc.desc   Test getCurrentP2pGroup API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                wifiMg.getCurrentP2pGroup(
                    (error,data) => {
                        if (error) {
                            console.error(`getCurrentP2pGroup callback code ${error.code}, message ${error.message}`);
                            expect(error.code).assertEqual("201")
                            return;
                        }
                        console.info("[wifi_test] getCurrentP2pGroup callback result: " + JSON.stringify(data));
                        expect().assertFail();
                    });
            } catch (error) {
                console.error(`getCurrentP2pGroup failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0056
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0056
         * @tc.desc   Test getP2pPeerDevices API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            (async () => {
                try {
                    let result = await wifiMg.getP2pPeerDevices();
                    console.info("[wifi_test] getP2pPeerDevices  promise successful :" + JSON.stringify(result));
                    expect().assertFail();
                } catch(error) {
                    console.error(`getP2pPeerDevices promise failed, code ${error.code}, message ${error.message}`);
                    expect(error.code).assertEqual("201")
                }
            })();
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0057
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0057
         * @tc.desc   Test getP2pPeerDevices API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                wifiMg.getP2pPeerDevices(
                    (error,data) => {
                        if (error) {
                            console.error(`getP2pPeerDevices callback, code ${error.code}, message ${error.message}`);
                            expect(error.code).assertEqual("201")
                            return;
                        }
                        console.info("[wifi_test] getP2pPeerDevices callback result: " + JSON.stringify(data));
                        expect().assertFail();
                    });
            } catch (error) {
                console.error(`getP2pPeerDevices failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0058
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0058
         * @tc.desc   Test getP2pLocalDevice API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            (async () => {
                try {
                    let result = await wifiMg.getP2pLocalDevice();
                    console.info("[wifi_test] getP2pLocalDevice  promise successful :" + JSON.stringify(result));
                    expect().assertFail();
                } catch(error) {
                    console.error(`getP2pLocalDevice promise failed, code ${error.code}, message ${error.message}`);
                    expect(error.code).assertEqual("201")
                }
            })();
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0059
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0059
         * @tc.desc   Test getP2pLocalDevice API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                wifiMg.getP2pLocalDevice(
                    (error,data) => {
                        if (error) {
                            console.error(`getP2pLocalDevice callbfailed, code ${error.code},message ${error.message}`);
                            expect(error.code).assertEqual("201")
                            return;
                        }
                        console.info("[wifi_test] getP2pLocalDevice callback result: " + JSON.stringify(data));
                        expect().assertFail();
                    });
            } catch (error) {
                console.error(`getP2pLocalDevice failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0060
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0060
         * @tc.desc   Test getP2pLocalDevice API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let wifiP2PConfig = {
                    deviceAddress : "00:00:00:00:00:00",
                    netId : -1,
                    passphrase : "12345678",
                    groupName : "test_band1",
                    goBand : wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
                };
                let createGroup = wifiMg.createP2pGroup(wifiP2PConfig);
                expect().assertFail();
            } catch (error) {
                console.error(`createP2pGroup failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0061
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0061
         * @tc.desc   Test removeP2pGroup API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let removeGroup = wifiMg.removeP2pGroup();
                expect().assertFail();
            } catch (error) {
                console.error(`removeGroup failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0062
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0062
         * @tc.desc   Test p2pConnect API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let wifiP2PConfig = {
                    deviceAddress : "00:00:00:00:00:00",
                    netId : -1,
                    passphrase : "12345678",
                    groupName : "test_band1",
                    goBand : wifiMg.GroupOwnerBand.GO_BAND_2GHZ,
                };
                let p2pConnect = wifiMg.p2pConnect(wifiP2PConfig);
                console.info("201 fail,has no permission but api is true");
                expect().assertFail();
            } catch (error) {
                console.error(`p2pConnect failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0063
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0063
         * @tc.desc   Test p2pCancelConnect API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let p2pCancelConnect = wifiMg.p2pCancelConnect();
                console.info("201 fail,has no permission but api is true");
                expect().assertFail();
            } catch (error) {
                console.error(`p2pCancelConnect failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0064
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0064
         * @tc.desc   Test startDiscoverDevices API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let startDiscoverDevices = wifiMg.startDiscoverP2pDevices();
                console.info("201 fail,has no permission but api is true");
                expect().assertFail();
            } catch (error) {
                console.error(`startDiscoverP2pDevices failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0065
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0065
         * @tc.desc   Test stopDiscoverP2pDevices API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            try {
                let stopDiscoverDevices = wifiMg.stopDiscoverP2pDevices();
                console.info("201 fail,has no permission but api is true");
                expect().assertFail();
            } catch (error) {
                console.error(`stopDiscoverP2pDevices failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0066
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0066
         * @tc.desc   Test wifiStateChange API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "wifiStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                console.info("wifiStateChange 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`wifiStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            try {
                wifiMg.off(wifiState, wifiStateChangeCallback);
                console.info("wifiStateChange off 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`wifiStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("2501000")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0067
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0067
         * @tc.desc   Test wifiConnectionChange API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "wifiConnectionChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                console.info("wifiConnectionChange 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`wifiConnectionChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            try {
                wifiMg.off(wifiState, wifiStateChangeCallback);
                console.info("wifiConnectionChange off 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`wifiConnectionChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("2501000")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0068
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0068
         * @tc.desc   Test wifiScanStateChange API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "wifiScanStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                console.info("wifiScanStateChange 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`wifiScanStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            try {
                wifiMg.off(wifiState, wifiStateChangeCallback);
                console.info("wifiScanStateChange off 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`wifiScanStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("2501000")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0069
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0069
         * @tc.desc   Test wifiRssiChange API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "wifiRssiChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                console.info("wifiRssiChange 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`wifiRssiChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            try {
                wifiMg.off(wifiState, wifiStateChangeCallback);
                console.info("wifiRssiChange off 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`wifiRssiChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("2501000")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0070
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0070
         * @tc.desc   Test hotspotStateChange API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "hotspotStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                console.info("hotspotStateChange 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`hotspotStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            try {
                wifiMg.off(wifiState, wifiStateChangeCallback);
                console.info("hotspotStateChange off 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`hotspotStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0071
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0071
         * @tc.desc   Test p2pStateChange API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pStateChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                console.info("p2pStateChange 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pStateChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            try {
                wifiMg.off(wifiState, wifiStateChangeCallback);
                console.info("p2pStateChange off 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pStateChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0072
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0072
         * @tc.desc   Test p2pConnectionChange API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pConnectionChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pConnectionChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                console.info("p2pConnectionChange 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pConnectionChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            try {
                wifiMg.off(wifiState, wifiStateChangeCallback);
                console.info("p2pConnectionChange off 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pConnectionChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0073
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0073
         * @tc.desc   Test p2pDeviceChange API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pDeviceChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pDeviceChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                console.info("p2pDeviceChange 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pDeviceChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            try {
                wifiMg.off(wifiState, wifiStateChangeCallback);
                console.info("p2pDeviceChange off 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pDeviceChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0074
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0074
         * @tc.desc   Test p2pPeerDeviceChange API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pPeerDeviceChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pPeerDeviceChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                console.info("p2pPeerDeviceChange 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pPeerDeviceChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            try {
                wifiMg.off(wifiState, wifiStateChangeCallback);
                console.info("p2pPeerDeviceChange off 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pPeerDeviceChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0075
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0075
         * @tc.desc   Test p2pPersistentGroupChange API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pPersistentGroupChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pPersistentGroupChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                console.info("p2pPersistentGroupChange 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pPersistentGroupChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            try {
                wifiMg.off(wifiState, wifiStateChangeCallback);
                console.info("p2pPersistentGroupChange off 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pPersistentGroupChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_XTS_ErrorCode_0076
         * @tc.number SUB_Communication_WiFi_XTS_ErrorCode_0076
         * @tc.desc   Test p2pDiscoveryChange API ErrorCode 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_XTS_ErrorCode_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "p2pDiscoveryChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]p2pDiscoveryChange callback, result: " + JSON.stringify(result));
            }
            try {
                wifiMg.on(wifiState, wifiStateChangeCallback);
                console.info("p2pDiscoveryChange 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pDiscoveryChange on failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            try {
                wifiMg.off(wifiState, wifiStateChangeCallback);
                console.info("p2pDiscoveryChange off 201 fail,has no permission but api is true");
            } catch (error) {
                console.error(`p2pDiscoveryChange off failed, code is ${error.code}, message is ${error.message}`);
                expect(error.code).assertEqual("201")
            }
            done();
        })

            console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}

