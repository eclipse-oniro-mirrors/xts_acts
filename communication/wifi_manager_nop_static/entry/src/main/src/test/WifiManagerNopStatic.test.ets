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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import wifiManager from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiNoPermissionTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function wifiManagerTest() {

    describe("wifiManagerTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.number enableWifiErrCode201Test
         * @tc.name enableWifiErrCode201Test
         * @tc.desc Test enableWifiErrCode201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("enableWifiErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                wifiManager.enableWifi();
                expect().assertFail();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "enableWifi get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number disableWifiErrCode201Test
         * @tc.name disableWifiErrCode201Test
         * @tc.desc Test disableWifiErrCode201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("disableWifiErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                wifiManager.disableWifi();
                expect().assertFail();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableWifi get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number isConnectedErrCode201Test
         * @tc.name isConnectedErrCode201Test
         * @tc.desc Test isConnectedErrCode201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("isConnectedErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let state = wifiManager.isConnected();
                hilog.info(domain, tag, "isConnected get:" + state);
                expect().assertFail();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isConnected get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getIpInfoErrCode201Test
         * @tc.name getIpInfoErrCode201Test
         * @tc.desc Test getIpInfoErrCode201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getIpInfoErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let info: wifiManager.IpInfo = wifiManager.getIpInfo();
                hilog.info(domain, tag, "getIpInfo get:" + info);
                expect().assertFail();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getIpInfo get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getScanInfoListErrCode201Test
         * @tc.name getScanInfoListErrCode201Test
         * @tc.desc Test getScanInfoListErrCode201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getScanInfoListErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let info: Array<wifiManager.WifiScanInfo> = wifiManager.getScanInfoList();
                hilog.info(domain, tag, "getScanInfoList get:" + info);
                expect().assertFail();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getScanInfoList get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number isMeteredHotspotErrCode201Test
         * @tc.name isMeteredHotspotErrCode201Test
         * @tc.desc Test isMeteredHotspotErrCode201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("isMeteredHotspotErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let metered = wifiManager.isMeteredHotspot();
                hilog.info(domain, tag, "isMeteredHotspot get:" + metered);
                expect().assertFail();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isMeteredHotspot get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getIpv6InfoErrCode201Test
         * @tc.name getIpv6InfoErrCode201Test
         * @tc.desc Test getIpv6InfoErrCode201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getIpv6InfoErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let info: wifiManager.Ipv6Info = wifiManager.getIpv6Info();
                hilog.info(domain, tag, "getIpv6Info get:" + info);
                expect().assertFail();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getIpv6Info get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getSignalLevelErrCode201Test
         * @tc.name getSignalLevelErrCode201Test
         * @tc.desc Test getSignalLevelErrCode201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getSignalLevelErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let level: number = wifiManager.getSignalLevel(0 ,0);
                hilog.info(domain, tag, 'getSignalLevel success result:' + level);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getSignalLevel get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getLinkedInfoPromise201Test
         * @tc.name getLinkedInfoPromise201Test
         * @tc.desc Test getLinkedInfoPromise201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getLinkedInfoPromise201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getLinkedInfoCallback201Test
         * @tc.name getLinkedInfoCallback201Test
         * @tc.desc Test getLinkedInfoCallback201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getLinkedInfoCallback201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            wifiManager.getLinkedInfo((err: BusinessError | null, data: wifiManager.WifiLinkedInfo| undefined) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "getLinkedInfo callback get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code === 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code === 801);
                        } else {
                            expect(true).assertEqual(err?.code === 201);
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
         * @tc.number getP2pLinkedInfoPromise201Test
         * @tc.name getP2pLinkedInfoPromise201Test
         * @tc.desc Test getP2pLinkedInfoPromise201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pLinkedInfoPromise201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getP2pLinkedInfo().then((data: wifiManager.WifiP2pLinkedInfo) => {});
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getP2pLinkedInfo promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getP2pLinkedInfoCallback201Test
         * @tc.name getP2pLinkedInfoCallback201Test
         * @tc.desc Test getP2pLinkedInfoCallback201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pLinkedInfoCallback201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            wifiManager.getP2pLinkedInfo((err: BusinessError | null, data: wifiManager.WifiP2pLinkedInfo | undefined) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "getP2pLinkedInfo callback get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code === 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code === 801);
                        } else {
                            expect(true).assertEqual(err?.code === 201);
                        }
                    } else {
                        expect().assertFail();
                    }
                } catch (err) {
                    err = err as BusinessError;
                    hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                    expect().assertFail();
    
                }
            })
            done();
        })

        /**
         * @tc.number getCurrentGroupPromise201Test
         * @tc.name getCurrentGroupPromise201Test
         * @tc.desc Test getCurrentGroupPromise201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getCurrentGroupPromise201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getCurrentGroup().then((data: wifiManager.WifiP2pGroupInfo) => {});
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getCurrentGroup promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getCurrentGroupCallback201Test
         * @tc.name getCurrentGroupCallback201Test
         * @tc.desc Test getCurrentGroupCallback201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getCurrentGroupCallback201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            wifiManager.getCurrentGroup((err: BusinessError | null, data: wifiManager.WifiP2pGroupInfo | undefined) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "getCurrentGroup callback get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code === 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code === 801);
                        } else {
                            expect(true).assertEqual(err?.code === 201);
                        }
                    } else {
                        expect().assertFail();
                    }
                } catch (err) {
                    err = err as BusinessError;
                    hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                    expect().assertFail();
                }
            })
            done();
        })

        /**
         * @tc.number getP2pPeerDevicesPromise201Test
         * @tc.name getP2pPeerDevicesPromise201Test
         * @tc.desc Test getP2pPeerDevicesPromise201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pPeerDevicesPromise201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getP2pPeerDevices().then((data: wifiManager.WifiP2pDevice[]) => {});
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getP2pPeerDevices promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getP2pPeerDevicesCallback201Test
         * @tc.name getP2pPeerDevicesCallback201Test
         * @tc.desc Test getP2pPeerDevicesCallback201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pPeerDevicesCallback201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            wifiManager.getP2pPeerDevices((err: BusinessError | null, data: wifiManager.WifiP2pDevice[] | undefined) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "getP2pPeerDevices callback get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code === 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code === 801);
                        } else {
                            expect(true).assertEqual(err?.code === 201);
                        }
                    } else {
                        expect().assertFail();
                    }
                } catch (err) {
                    err = err as BusinessError;
                    hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                    expect().assertFail();
                }
            })
            done();
        })

        /**
         * @tc.number getP2pLocalDevicePromise201Test
         * @tc.name getP2pLocalDevicePromise201Test
         * @tc.desc Test getP2pLocalDevicePromise201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pLocalDevicePromise201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getP2pLocalDevice().then((data: wifiManager.WifiP2pDevice) => {});
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getP2pLocalDevice promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getP2pLocalDeviceCallback201Test
         * @tc.name getP2pLocalDeviceCallback201Test
         * @tc.desc Test getP2pLocalDeviceCallback201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pLocalDeviceCallback201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            wifiManager.getP2pLocalDevice((err: BusinessError | null, data: wifiManager.WifiP2pDevice | undefined) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "getP2pLocalDevice callback get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code === 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code === 801);
                        } else {
                            expect(true).assertEqual(err?.code === 201);
                        }
                    } else {
                        expect().assertFail();
                    }
                } catch (err) {
                    err = err as BusinessError;
                    hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                    expect().assertFail();
                }
            })
            done();
        })

        /**
         * @tc.number addDeviceConfigPromise201Test
         * @tc.name addDeviceConfigPromise201Test
         * @tc.desc Test addDeviceConfigPromise201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("addDeviceConfigPromise201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number addDeviceConfigCallback201Test
         * @tc.name addDeviceConfigCallback201Test
         * @tc.desc Test addDeviceConfigCallback201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("addDeviceConfigCallback201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                            expect(true).assertEqual(err?.code === 201);
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
         * @tc.number addCandidateConfigPromise201Test
         * @tc.name addCandidateConfigPromise201Test
         * @tc.desc Test addCandidateConfigPromise201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("addCandidateConfigPromise201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
                    "ssid": "publicTest",
                    "bssid": "00:11:22:33:44:55",
                    "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
                    "preSharedKey": "",
                    "isHiddenSsid": false,
                    "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
                };
                await wifiManager.addCandidateConfig(wifiDeviceConfig).then((netWorkId: int) => {});
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "addCandidateConfig promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number addCandidateConfigCallback201Test
         * @tc.name addCandidateConfigCallback201Test
         * @tc.desc Test addCandidateConfigCallback201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("addCandidateConfigCallback201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
                "ssid": "publicTest",
                "bssid": "00:11:22:33:44:55",
                "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
                "preSharedKey": "",
                "isHiddenSsid": false,
                "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
            };
            wifiManager.addCandidateConfig(wifiDeviceConfig, (err: BusinessError | null, netWorkId: int | undefined) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "addCandidateConfig callback get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code === 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code === 801);
                        } else {
                            expect(true).assertEqual(err?.code === 201);
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
         * @tc.number removeCandidateConfigPromise201Test
         * @tc.name removeCandidateConfigPromise201Test
         * @tc.desc Test removeCandidateConfigPromise201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("removeCandidateConfigPromise201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number removeCandidateConfigCallback201Test
         * @tc.name removeCandidateConfigCallback201Test
         * @tc.desc Test removeCandidateConfigCallback201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("removeCandidateConfigCallback201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            wifiManager.removeCandidateConfig(0, (err: BusinessError | null) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "removeCandidateConfig callback get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code === 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code === 801);
                        } else {
                            expect(true).assertEqual(err?.code === 201);
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
         * @tc.number getLinkedInfoSync201Test
         * @tc.name getLinkedInfoSync201Test
         * @tc.desc Test getLinkedInfoSync201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getLinkedInfoSync201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getCandidateConfigs201Test
         * @tc.name getCandidateConfigs201Test
         * @tc.desc Test getCandidateConfigs201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getCandidateConfigs201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let deviceConfig: Array<wifiManager.WifiDeviceConfig> = wifiManager.getCandidateConfigs();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getCandidateConfigs get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getDeviceConfigs201Test
         * @tc.name getDeviceConfigs201Test
         * @tc.desc Test getDeviceConfigs201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getDeviceConfigs201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let deviceConfig: Array<wifiManager.WifiDeviceConfig> = wifiManager.getDeviceConfigs();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getDeviceConfigs get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number connectToCandidateConfig201Test
         * @tc.name connectToCandidateConfig201Test
         * @tc.desc Test connectToCandidateConfig201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("connectToCandidateConfig201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number connectToNetwork201Test
         * @tc.name connectToNetwork201Test
         * @tc.desc Test connectToNetwork201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("connectToNetwork201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number removeDevice201Test
         * @tc.name removeDevice201Test
         * @tc.desc Test removeDevice201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("removeDevice201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number disconnect201Test
         * @tc.name disconnect201Test
         * @tc.desc Test disconnect201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("disconnect201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getMultiLinkedInfo201Test
         * @tc.name getMultiLinkedInfo201Test
         * @tc.desc Test getMultiLinkedInfo201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getMultiLinkedInfo201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let multiLinkedInfo: Array<wifiManager.WifiLinkedInfo> = wifiManager.getMultiLinkedInfo();
                hilog.info(domain, tag, 'getMultiLinkedInfo success result:' + JSON.stringify(multiLinkedInfo));
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getMultiLinkedInfo get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number isFeatureSupported201Test
         * @tc.name isFeatureSupported201Test
         * @tc.desc Test isFeatureSupported201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("isFeatureSupported201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let supported: boolean = wifiManager.isFeatureSupported(0);
                hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getDeviceMacAddress201Test
         * @tc.name getDeviceMacAddress201Test
         * @tc.desc Test getDeviceMacAddress201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getDeviceMacAddress201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let addr: string[] = wifiManager.getDeviceMacAddress();
                hilog.info(domain, tag, 'getDeviceMacAddress success result:' + JSON.stringify(addr));
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getDeviceMacAddress get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number getCountryCode201Test
         * @tc.name getCountryCode201Test
         * @tc.desc Test getCountryCode201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getCountryCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let countryCode: string = wifiManager.getCountryCode();
                hilog.info(domain, tag, 'getCountryCode success result:' + JSON.stringify(countryCode));
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getCountryCode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number isBandTypeSupported201Test
         * @tc.name isBandTypeSupported201Test
         * @tc.desc Test isBandTypeSupported201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("isBandTypeSupported201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let supported: boolean = wifiManager.isBandTypeSupported(wifiManager.WifiBandType.WIFI_BAND_NONE);
                hilog.info(domain, tag, 'isBandTypeSupported success result:' + JSON.stringify(supported));
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isBandTypeSupported get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number isHotspotActive201Test
         * @tc.name isHotspotActive201Test
         * @tc.desc Test isHotspotActive201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("isHotspotActive201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let apActive: boolean = wifiManager.isHotspotActive();
                hilog.info(domain, tag, 'isHotspotActive success result:' + JSON.stringify(apActive));
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isHotspotActive get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number createGroup201Test
         * @tc.name createGroup201Test
         * @tc.desc Test createGroup201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("createGroup201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number removeGroup201Test
         * @tc.name removeGroup201Test
         * @tc.desc Test removeGroup201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("removeGroup201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number p2pConnect201Test
         * @tc.name p2pConnect201Test
         * @tc.desc Test p2pConnect201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pConnect201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number p2pCancelConnect201Test
         * @tc.name p2pCancelConnect201Test
         * @tc.desc Test p2pCancelConnect201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pCancelConnect201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number startDiscoverDevices201Test
         * @tc.name startDiscoverDevices201Test
         * @tc.desc Test startDiscoverDevices201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("startDiscoverDevices201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number stopDiscoverDevices201Test
         * @tc.name stopDiscoverDevices201Test
         * @tc.desc Test stopDiscoverDevices201Test API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("stopDiscoverDevices201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })
    })
}