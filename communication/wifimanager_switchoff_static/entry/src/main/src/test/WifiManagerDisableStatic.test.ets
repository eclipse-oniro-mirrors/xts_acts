/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import wifiManager from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiDisableTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function wifiDisableTest() {

    describe("wifiDisableTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            await Utils.closeWifi();
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })
        afterAll(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'afterAll start');
            await Utils.openWifi();
            hilog.info(domain, tag, '%{public}s', 'afterAll end');
        })
        /**
         * @tc.number isMeteredHotspotErrCode2501001Test
         * @tc.name isMeteredHotspotErrCode2501001Test
         * @tc.desc Test isMeteredHotspotErrCode2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("isMeteredHotspotErrCode2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let metered: boolean = wifiManager.isMeteredHotspot();
                hilog.info(domain, tag, "isMeteredHotspot:" + metered);
                expect().assertFail();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isMeteredHotspot get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501001);
                }
            }
            done();
        })

        /**
         * @tc.number getLinkedInfoPromise2501001Test
         * @tc.name getLinkedInfoPromise2501001Test
         * @tc.desc Test getLinkedInfoPromise2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getLinkedInfoPromise2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getLinkedInfo().then((data: wifiManager.WifiLinkedInfo) => {});
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLinkedInfo promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501001);
                }
            }
            done();
        })

        /**
         * @tc.number getLinkedInfoCallback2501001Test
         * @tc.name getLinkedInfoCallback2501001Test
         * @tc.desc Test getLinkedInfoCallback2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getLinkedInfoCallback2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            wifiManager.getLinkedInfo((err: BusinessError | null, data: wifiManager.WifiLinkedInfo| undefined) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "getLinkedInfo promise get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code === 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code === 801);
                        } else {
                            expect(true).assertEqual(err?.code === 2501001);
                        }
                    } else {
                        expect().assertFail();
                    }
                } catch (err) {
                    err = err as BusinessError;
                    hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                }
            })
            done();
        })

        /**
         * @tc.number getLinkedInfoSync2501001Test
         * @tc.name getLinkedInfoSync2501001Test
         * @tc.desc Test getLinkedInfoSync2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getLinkedInfoSync2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let infoSync: wifiManager.WifiLinkedInfo = wifiManager.getLinkedInfoSync();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLinkedInfoSync get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501001);
                }
            }
            done();
        })

        /**
         * @tc.number addDeviceConfigPromise2501001Test
         * @tc.name addDeviceConfigPromise2501001Test
         * @tc.desc Test addDeviceConfigPromise2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("addDeviceConfigPromise2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
                    "ssid": "publicTest",
                    "bssid": "00:11:22:33:44:55",
                    "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
                    "preSharedKey": "",
                    "isHiddenSsid": false,
                    "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
                };
                await wifiManager.addDeviceConfig(wifiDeviceConfig).then((netWorkId: int) => {});
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "addDeviceConfig promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501001);
                }
            }
            done();
        })

        /**
         * @tc.number addDeviceConfigCallback2501001Test
         * @tc.name addDeviceConfigCallback2501001Test
         * @tc.desc Test addDeviceConfigCallback2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("addDeviceConfigCallback2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
                "ssid": "publicTest",
                "bssid": "00:11:22:33:44:55",
                "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
                "preSharedKey": "",
                "isHiddenSsid": false,
                "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
            };
            wifiManager.addDeviceConfig(wifiDeviceConfig, (err: BusinessError | null, netWorkId: int | undefined) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "addDeviceConfig callback get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code === 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code === 801);
                        } else {
                            expect(true).assertEqual(err?.code === 2501001);
                        }
                    } else {
                        expect().assertFail();
                    }
                } catch (err) {
                    err = err as BusinessError;
                    hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                }
            })
            done();
        })

        /**
         * @tc.number removeCandidateConfigPromise2501001Test
         * @tc.name removeCandidateConfigPromise2501001Test
         * @tc.desc Test removeCandidateConfigPromise2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("removeCandidateConfigPromise2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.removeCandidateConfig(0).then(() => {});
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "removeCandidateConfig promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501001);
                }
            }
            done();
        })

        /**
         * @tc.number removeCandidateConfigCallback2501001Test
         * @tc.name removeCandidateConfigCallback2501001Test
         * @tc.desc Test removeCandidateConfigCallback2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("removeCandidateConfigCallback2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            wifiManager.removeCandidateConfig(0, (err: BusinessError | null) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "removeCandidateConfig callback get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code === 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code === 801);
                        } else {
                            expect(true).assertEqual(err?.code === 2501001);
                        }
                    } else {
                        expect().assertFail();
                    }
                } catch (err) {
                    err = err as BusinessError;
                    hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                }
            })
            done();
        })

        /**
         * @tc.number connectToCandidateConfig2501001Test
         * @tc.name connectToCandidateConfig2501001Test
         * @tc.desc Test connectToCandidateConfig2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("connectToCandidateConfig2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                wifiManager.connectToCandidateConfig(0);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "connectToCandidateConfig get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501001);
                }
            }
            done();
        })

        /**
         * @tc.number connectToNetwork2501001Test
         * @tc.name connectToNetwork2501001Test
         * @tc.desc Test connectToNetwork2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("connectToNetwork2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                wifiManager.connectToNetwork(0);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "connectToNetwork get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501001);
                }
            }
            done();
        })

        /**
         * @tc.number removeDevice2501001Test
         * @tc.name removeDevice2501001Test
         * @tc.desc Test removeDevice2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("removeDevice2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                wifiManager.removeDevice(0);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "removeDevice get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501001);
                }
            }
            done();
        })

        /**
         * @tc.number disconnect2501001Test
         * @tc.name disconnect2501001Test
         * @tc.desc Test disconnect2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("disconnect2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                wifiManager.disconnect();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disconnect get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501001);
                }
            }
            done();
        })

        /**
         * @tc.number getMultiLinkedInfo2501001Test
         * @tc.name getMultiLinkedInfo2501001Test
         * @tc.desc Test getMultiLinkedInfo2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getMultiLinkedInfo2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let multiLinkedInfo: Array<wifiManager.WifiLinkedInfo> = wifiManager.getMultiLinkedInfo();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getMultiLinkedInfo get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501001);
                }
            }
            done();
        })

        /**
         * @tc.number getDeviceMacAddress2501001Test
         * @tc.name getDeviceMacAddress2501001Test
         * @tc.desc Test getDeviceMacAddress2501001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getDeviceMacAddress2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let addr: string[] = wifiManager.getDeviceMacAddress();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getDeviceMacAddress get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501001);
                }
            }
            done();
        })

        /**
         * @tc.number createGroup2801001Test
         * @tc.name createGroup2801001Test
         * @tc.desc Test createGroup2801001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("createGroup2801001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let wifiP2PConfig: wifiManager.WifiP2PConfig = {
                    deviceAddress: "00:11:22:33:44:55",
                    deviceAddressType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
                    netId: -1,
                    passphrase : "12345678",
                    groupName : "createTemporaryP2pGroup",
                    goBand : wifiManager.GroupOwnerBand.GO_BAND_AUTO
                }
                wifiManager.createGroup(wifiP2PConfig);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createGroup get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2801001);
                }
            }
            done();
        })

        /**
         * @tc.number removeGroup2801001Test
         * @tc.name removeGroup2801001Test
         * @tc.desc Test removeGroup2801001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("removeGroup2801001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                wifiManager.removeGroup();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "removeGroup get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2801001);
                }
            }
            done();
        })

        /**
         * @tc.number p2pConnect2801001Test
         * @tc.name p2pConnect2801001Test
         * @tc.desc Test p2pConnect2801001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pConnect2801001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let wifiP2PConfig: wifiManager.WifiP2PConfig = {
                    deviceAddress: "00:11:22:33:44:55",
                    deviceAddressType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
                    netId: -1,
                    passphrase : "12345678",
                    groupName : "createTemporaryP2pGroup",
                    goBand : wifiManager.GroupOwnerBand.GO_BAND_AUTO
                }
                wifiManager.p2pConnect(wifiP2PConfig);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "p2pConnect get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2801001);
                }
            }
            done();
        })

        /**
         * @tc.number p2pCancelConnect2801001Test
         * @tc.name p2pCancelConnect2801001Test
         * @tc.desc Test p2pCancelConnect2801001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pCancelConnect2801001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                wifiManager.p2pCancelConnect();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "p2pCancelConnect get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2801001);
                }
            }
            done();
        })

        /**
         * @tc.number startDiscoverDevices2801001Test
         * @tc.name startDiscoverDevices2801001Test
         * @tc.desc Test startDiscoverDevices2801001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("startDiscoverDevices2801001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                wifiManager.startDiscoverDevices();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startDiscoverDevices get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2801001);
                }
            }
            done();
        })

        /**
         * @tc.number stopDiscoverDevices2801001Test
         * @tc.name stopDiscoverDevices2801001Test
         * @tc.desc Test stopDiscoverDevices2801001Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("stopDiscoverDevices2801001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                wifiManager.stopDiscoverDevices();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopDiscoverDevices get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2801001);
                }
            }
            done();
        })
    })
}