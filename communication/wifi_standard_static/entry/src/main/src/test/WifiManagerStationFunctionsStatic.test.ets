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
import CallbackMethods from './CallbackMethod.test';
import wifiManager from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function actsWifiManagerFunctionsTest() {

    describe("actsWifiManagerFunctionsTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            await Utils.openWifi();
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        afterAll(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'afterAll start');
            await Utils.closeWifi();
            await Utils.openWifi();
            hilog.info(domain, tag, '%{public}s', 'afterAll end');
        })

        /**
         * @tc.number constantWifiSecurityTypeTest
         * @tc.name constantWifiSecurityTypeTest
         * @tc.desc Test WifiSecurityType API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("constantWifiSecurityTypeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let WIFI_SEC_TYPE_OPEN: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_OPEN:" + WIFI_SEC_TYPE_OPEN);
                expect(true).assertEqual(WIFI_SEC_TYPE_OPEN === 1);
                let WIFI_SEC_TYPE_SAE: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_SAE;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_SAE:" + WIFI_SEC_TYPE_SAE);
                expect(true).assertEqual(WIFI_SEC_TYPE_SAE === 4);
                let WIFI_SEC_TYPE_PSK: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_PSK:" + WIFI_SEC_TYPE_PSK);
                expect(true).assertEqual(WIFI_SEC_TYPE_PSK === 3);
                let WIFI_SEC_TYPE_INVALID: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_INVALID:" + WIFI_SEC_TYPE_INVALID);
                expect(true).assertEqual(WIFI_SEC_TYPE_INVALID === 0);
                let WIFI_SEC_TYPE_WEP: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WEP;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_WEP:" + WIFI_SEC_TYPE_WEP);
                expect(true).assertEqual(WIFI_SEC_TYPE_WEP === 2);
                let WIFI_SEC_TYPE_EAP: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_EAP:" + WIFI_SEC_TYPE_EAP);
                expect(true).assertEqual(WIFI_SEC_TYPE_EAP === 5);
                let WIFI_SEC_TYPE_EAP_SUITE_B: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_EAP_SUITE_B:" + WIFI_SEC_TYPE_EAP_SUITE_B);
                expect(true).assertEqual(WIFI_SEC_TYPE_EAP_SUITE_B === 6);
                let WIFI_SEC_TYPE_OWE: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_OWE:" + WIFI_SEC_TYPE_OWE);
                expect(true).assertEqual(WIFI_SEC_TYPE_OWE === 7);
                let WIFI_SEC_TYPE_WAPI_CERT: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_WAPI_CERT:" + WIFI_SEC_TYPE_WAPI_CERT);
                expect(true).assertEqual(WIFI_SEC_TYPE_WAPI_CERT === 8);
                let WIFI_SEC_TYPE_WAPI_PSK: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK;
                hilog.info(domain, tag, "WIFI_SEC_TYPE_WAPI_PSK:" + WIFI_SEC_TYPE_WAPI_PSK);
                expect(true).assertEqual(WIFI_SEC_TYPE_WAPI_PSK === 9);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "constant WifiSecurityType get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant WifiSecurityType get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number constantP2pDeviceStatusTest
         * @tc.name constantP2pDeviceStatusTest
         * @tc.desc Test P2pDeviceStatus API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("constantP2pDeviceStatusTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let DEVICE_CONNECTED: wifiManager.P2pDeviceStatus = wifiManager.P2pDeviceStatus.CONNECTED;
                hilog.info(domain, tag, "DEVICE_CONNECTED:" + DEVICE_CONNECTED);
                expect(true).assertEqual(DEVICE_CONNECTED === 0);
                let DEVICE_INVITED: wifiManager.P2pDeviceStatus = wifiManager.P2pDeviceStatus.INVITED;
                hilog.info(domain, tag, "DEVICE_INVITED:" + DEVICE_INVITED);
                expect(true).assertEqual(DEVICE_INVITED === 1);
                let DEVICE_FAILED: wifiManager.P2pDeviceStatus = wifiManager.P2pDeviceStatus.FAILED;
                hilog.info(domain, tag, "DEVICE_FAILED:" + DEVICE_FAILED);
                expect(true).assertEqual(DEVICE_FAILED === 2);
                let DEVICE_AVAILABLE: wifiManager.P2pDeviceStatus = wifiManager.P2pDeviceStatus.AVAILABLE;
                hilog.info(domain, tag, "DEVICE_AVAILABLE:" + DEVICE_AVAILABLE);
                expect(true).assertEqual(DEVICE_AVAILABLE === 3);
                let DEVICE_UNAVAILABLE: wifiManager.P2pDeviceStatus = wifiManager.P2pDeviceStatus.UNAVAILABLE;
                hilog.info(domain, tag, "DEVICE_UNAVAILABLE:" + DEVICE_UNAVAILABLE);
                expect(true).assertEqual(DEVICE_UNAVAILABLE === 4);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "constant P2pDeviceStatus get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant P2pDeviceStatus get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number constantP2pConnectStateTest
         * @tc.name constantP2pConnectStateTest
         * @tc.desc Test P2pConnectState API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("constantP2pConnectStateTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let P2PCONN_CONNECTED: wifiManager.P2pConnectState = wifiManager.P2pConnectState.CONNECTED;
                hilog.info(domain, tag, "P2PCONN_CONNECTED:" + P2PCONN_CONNECTED);
                expect(true).assertEqual(P2PCONN_CONNECTED === 1);
                let P2PCONN_DISCONNECTED: wifiManager.P2pConnectState = wifiManager.P2pConnectState.DISCONNECTED;
                hilog.info(domain, tag, "P2PCONN_DISCONNECTED:" + P2PCONN_DISCONNECTED);
                expect(true).assertEqual(P2PCONN_DISCONNECTED === 0);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "constant P2pConnectState get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant P2pConnectState get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number constantWifiCategoryTest
         * @tc.name constantWifiCategoryTest
         * @tc.desc Test WifiCategory API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("constantWifiCategoryTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let WIFI6: wifiManager.WifiCategory = wifiManager.WifiCategory.WIFI6;
                hilog.info(domain, tag, "WIFI6:" + WIFI6);
                expect(true).assertEqual(WIFI6 === 2);
                let WIFI6_PLUS: wifiManager.WifiCategory = wifiManager.WifiCategory.WIFI6_PLUS;
                hilog.info(domain, tag, "WIFI6_PLUS:" + WIFI6_PLUS);
                expect(true).assertEqual(WIFI6_PLUS === 3);
                let DEFAULT: wifiManager.WifiCategory = wifiManager.WifiCategory.DEFAULT;
                hilog.info(domain, tag, "DEFAULT:" + DEFAULT);
                expect(true).assertEqual(DEFAULT === 1);
                let WIFI7: wifiManager.WifiCategory = wifiManager.WifiCategory.WIFI7;
                hilog.info(domain, tag, "WIFI7:" + WIFI7);
                expect(true).assertEqual(WIFI7 === 4);
                let WIFI7_PLUS: wifiManager.WifiCategory = wifiManager.WifiCategory.WIFI7_PLUS;
                hilog.info(domain, tag, "WIFI7_PLUS:" + WIFI7_PLUS);
                expect(true).assertEqual(WIFI7_PLUS === 5);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "constant WifiCategory get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant WifiCategory get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number constantWifiLinkTypeTest
         * @tc.name constantWifiLinkTypeTest
         * @tc.desc Test WifiLinkType API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("constantWifiLinkTypeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let DEFAULT_LINK: wifiManager.WifiLinkType = wifiManager.WifiLinkType.DEFAULT_LINK;
                hilog.info(domain, tag, "DEFAULT_LINK:" + DEFAULT_LINK);
                expect(true).assertEqual(DEFAULT_LINK === 0);
                let WIFI7_SINGLE_LINK: wifiManager.WifiLinkType = wifiManager.WifiLinkType.WIFI7_SINGLE_LINK;
                hilog.info(domain, tag, "WIFI7_SINGLE_LINK:" + WIFI7_SINGLE_LINK);
                expect(true).assertEqual(WIFI7_SINGLE_LINK === 1);
                let WIFI7_MLSR: wifiManager.WifiLinkType = wifiManager.WifiLinkType.WIFI7_MLSR;
                hilog.info(domain, tag, "WIFI7_MLSR:" + WIFI7_MLSR);
                expect(true).assertEqual(WIFI7_MLSR === 2);
                let WIFI7_EMLSR: wifiManager.WifiLinkType = wifiManager.WifiLinkType.WIFI7_EMLSR;
                hilog.info(domain, tag, "WIFI7_EMLSR:" + WIFI7_EMLSR);
                expect(true).assertEqual(WIFI7_EMLSR === 3);
                let WIFI7_STR: wifiManager.WifiLinkType = wifiManager.WifiLinkType.WIFI7_STR;
                hilog.info(domain, tag, "WIFI7_STR:" + WIFI7_STR);
                expect(true).assertEqual(WIFI7_STR === 4);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "constant WifiLinkType get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant WifiLinkType get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number constantWifiChannelWidthTest
         * @tc.name constantWifiChannelWidthTest
         * @tc.desc Test WifiChannelWidth API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("constantWifiChannelWidthTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let WIDTH_20MHZ: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_20MHZ;
                hilog.info(domain, tag, "WIDTH_20MHZ:" + WIDTH_20MHZ);
                expect(true).assertEqual(WIDTH_20MHZ === 0);
                let WIDTH_40MHZ: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_40MHZ;
                hilog.info(domain, tag, "WIDTH_40MHZ:" + WIDTH_40MHZ);
                expect(true).assertEqual(WIDTH_40MHZ === 1);
                let WIDTH_80MHZ: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_80MHZ;
                hilog.info(domain, tag, "WIDTH_80MHZ:" + WIDTH_80MHZ);
                expect(true).assertEqual(WIDTH_80MHZ === 2);
                let WIDTH_160MHZ: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_160MHZ;
                hilog.info(domain, tag, "WIDTH_160MHZ:" + WIDTH_160MHZ);
                expect(true).assertEqual(WIDTH_160MHZ === 3);
                let WIDTH_80MHZ_PLUS: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_80MHZ_PLUS;
                hilog.info(domain, tag, "WIDTH_80MHZ_PLUS:" + WIDTH_80MHZ_PLUS);
                expect(true).assertEqual(WIDTH_80MHZ_PLUS === 4);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "constant WifiChannelWidth get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant WifiChannelWidth get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number constantWapiPskTypeTest
         * @tc.name constantWapiPskTypeTest
         * @tc.desc Test WapiPskType API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("constantWapiPskTypeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let WAPI_PSK_ASCII: wifiManager.WapiPskType = wifiManager.WapiPskType.WAPI_PSK_ASCII;
                hilog.info(domain, tag, "WAPI_PSK_ASCII:" + WAPI_PSK_ASCII);
                expect(true).assertEqual(WAPI_PSK_ASCII === 0);
                let WAPI_PSK_HEX: wifiManager.WapiPskType = wifiManager.WapiPskType.WAPI_PSK_HEX;
                hilog.info(domain, tag, "WAPI_PSK_HEX:" + WAPI_PSK_HEX);
                expect(true).assertEqual(WAPI_PSK_HEX === 1);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "constant WapiPskType get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant WapiPskType get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number constantGroupOwnerBandTest
         * @tc.name constantGroupOwnerBandTest
         * @tc.desc Test GroupOwnerBand API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("constantGroupOwnerBandTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let GO_BAND_AUTO: wifiManager.GroupOwnerBand = wifiManager.GroupOwnerBand.GO_BAND_AUTO;
                hilog.info(domain, tag, "GO_BAND_AUTO:" + GO_BAND_AUTO);
                expect(true).assertEqual(GO_BAND_AUTO === 0);
                let GO_BAND_2GHZ: wifiManager.GroupOwnerBand = wifiManager.GroupOwnerBand.GO_BAND_2GHZ;
                hilog.info(domain, tag, "GO_BAND_2GHZ:" + GO_BAND_2GHZ);
                expect(true).assertEqual(GO_BAND_2GHZ === 1);
                let GO_BAND_5GHZ: wifiManager.GroupOwnerBand = wifiManager.GroupOwnerBand.GO_BAND_5GHZ;
                hilog.info(domain, tag, "GO_BAND_5GHZ:" + GO_BAND_5GHZ);
                expect(true).assertEqual(GO_BAND_5GHZ === 2);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "constant GroupOwnerBand get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant GroupOwnerBand get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number constantTest
         * @tc.name constantTest
         * @tc.desc Test constantTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("constantTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let RANDOM_DEVICE_ADDRESS: wifiManager.DeviceAddressType = wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS;
                hilog.info(domain, tag, "RANDOM_DEVICE_ADDRESS:" + RANDOM_DEVICE_ADDRESS);
                let REAL_DEVICE_ADDRESS: wifiManager.DeviceAddressType = wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS;
                hilog.info(domain, tag, "RANDOM_DEVICE_ADDRESS:" + REAL_DEVICE_ADDRESS);
                let EAP_NONE: wifiManager.EapMethod = wifiManager.EapMethod.EAP_NONE;
                hilog.info(domain, tag, "EAP_NONE:" + EAP_NONE);
                let EAP_PEAP: wifiManager.EapMethod = wifiManager.EapMethod.EAP_PEAP;
                hilog.info(domain, tag, "EAP_PEAP:" + EAP_PEAP);
                let EAP_TLS: wifiManager.EapMethod = wifiManager.EapMethod.EAP_TLS;
                hilog.info(domain, tag, "EAP_TLS:" + EAP_TLS);
                let EAP_TTLS: wifiManager.EapMethod = wifiManager.EapMethod.EAP_TTLS;
                hilog.info(domain, tag, "EAP_TTLS:" + EAP_TTLS);
                let EAP_PWD: wifiManager.EapMethod = wifiManager.EapMethod.EAP_PWD;
                hilog.info(domain, tag, "EAP_PWD:" + EAP_PWD);
                let EAP_SIM: wifiManager.EapMethod = wifiManager.EapMethod.EAP_SIM;
                hilog.info(domain, tag, "EAP_SIM:" + EAP_SIM);
                let EAP_AKA: wifiManager.EapMethod = wifiManager.EapMethod.EAP_AKA;
                hilog.info(domain, tag, "EAP_AKA:" + EAP_AKA);
                let EAP_AKA_PRIME: wifiManager.EapMethod = wifiManager.EapMethod.EAP_AKA_PRIME;
                hilog.info(domain, tag, "EAP_AKA_PRIME:" + EAP_AKA_PRIME);
                let EAP_UNAUTH_TLS: wifiManager.EapMethod = wifiManager.EapMethod.EAP_UNAUTH_TLS;
                hilog.info(domain, tag, "EAP_UNAUTH_TLS:" + EAP_UNAUTH_TLS);
                let PHASE2_NONE: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_NONE;
                hilog.info(domain, tag, "PHASE2_NONE:" + PHASE2_NONE);
                let PHASE2_PAP: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_PAP;
                hilog.info(domain, tag, "PHASE2_PAP:" + PHASE2_PAP);
                let PHASE2_MSCHAP: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_MSCHAP;
                hilog.info(domain, tag, "PHASE2_MSCHAP:" + PHASE2_MSCHAP);
                let PHASE2_MSCHAPV2: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_MSCHAPV2;
                hilog.info(domain, tag, "PHASE2_MSCHAPV2:" + PHASE2_MSCHAPV2);
                let PHASE2_GTC: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_GTC;
                hilog.info(domain, tag, "PHASE2_GTC:" + PHASE2_GTC);
                let PHASE2_SIM: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_SIM;
                hilog.info(domain, tag, "PHASE2_SIM:" + PHASE2_SIM);
                let PHASE2_AKA: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_AKA;
                hilog.info(domain, tag, "PHASE2_AKA:" + PHASE2_AKA);
                let PHASE2_AKA_PRIME: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_AKA_PRIME;
                hilog.info(domain, tag, "PHASE2_AKA_PRIME:" + PHASE2_AKA_PRIME);
                let WIDTH_INVALID: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_INVALID;
                hilog.info(domain, tag, "WIDTH_INVALID:" + WIDTH_INVALID);
                let WIFI_BAND_NONE: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_NONE;
                hilog.info(domain, tag, "WIFI_BAND_NONE:" + WIFI_BAND_NONE);
                let WIFI_BAND_2G: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_2G;
                hilog.info(domain, tag, "WIFI_BAND_2G:" + WIFI_BAND_2G);
                let WIFI_BAND_5G: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_5G;
                hilog.info(domain, tag, "WIFI_BAND_5G:" + WIFI_BAND_5G);
                let WIFI_BAND_6G: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_6G;
                hilog.info(domain, tag, "WIFI_BAND_6G:" + WIFI_BAND_6G);
                let WIFI_BAND_60G: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_60G;
                hilog.info(domain, tag, "WIFI_BAND_60G:" + WIFI_BAND_60G);
                let WIFI_STANDARD_UNDEFINED: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_UNDEFINED;
                hilog.info(domain, tag, "WIFI_STANDARD_UNDEFINED:" + WIFI_STANDARD_UNDEFINED);
                let WIFI_STANDARD_11A: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11A;
                hilog.info(domain, tag, "WIFI_STANDARD_11A:" + WIFI_STANDARD_11A);
                let WIFI_STANDARD_11B: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11B;
                hilog.info(domain, tag, "WIFI_STANDARD_11B:" + WIFI_STANDARD_11B);
                let WIFI_STANDARD_11G: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11G;
                hilog.info(domain, tag, "WIFI_STANDARD_11G:" + WIFI_STANDARD_11G);
                let WIFI_STANDARD_11N: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11N;
                hilog.info(domain, tag, "WIFI_STANDARD_11N:" + WIFI_STANDARD_11N);
                let WIFI_STANDARD_11AC: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11AC;
                hilog.info(domain, tag, "WIFI_STANDARD_11AC:" + WIFI_STANDARD_11AC);
                let WIFI_STANDARD_11AX: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11AX;
                hilog.info(domain, tag, "WIFI_STANDARD_11AX:" + WIFI_STANDARD_11AX);
                let WIFI_STANDARD_11AD: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11AD;
                hilog.info(domain, tag, "WIFI_STANDARD_11AD:" + WIFI_STANDARD_11AD);
                let SCANNING: wifiManager.ConnState = wifiManager.ConnState.SCANNING;
                hilog.info(domain, tag, "SCANNING:" + SCANNING);
                let CONNECTING: wifiManager.ConnState = wifiManager.ConnState.CONNECTING;
                hilog.info(domain, tag, "CONNECTING:" + CONNECTING);
                let AUTHENTICATING: wifiManager.ConnState = wifiManager.ConnState.AUTHENTICATING;
                hilog.info(domain, tag, "AUTHENTICATING:" + AUTHENTICATING);
                let OBTAINING_IPADDR: wifiManager.ConnState = wifiManager.ConnState.OBTAINING_IPADDR;
                hilog.info(domain, tag, "OBTAINING_IPADDR:" + OBTAINING_IPADDR);
                let DISCONNECTING: wifiManager.ConnState = wifiManager.ConnState.DISCONNECTING;
                hilog.info(domain, tag, "DISCONNECTING:" + DISCONNECTING);
                let DISCONNECTED: wifiManager.ConnState = wifiManager.ConnState.DISCONNECTED;
                hilog.info(domain, tag, "DISCONNECTED:" + DISCONNECTED);
                let UNKNOWN: wifiManager.ConnState = wifiManager.ConnState.UNKNOWN;
                hilog.info(domain, tag, "UNKNOWN:" + UNKNOWN);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "constant constantTest get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant constantTest get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number wifiOnOffStateTest
         * @tc.name wifiOnOffStateTest
         * @tc.desc Test wifiOnOffStateTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("wifiOnOffStateTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo state result:" + changeInfo);
            }
            try{
                wifiManager.onWifiStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            try{
                wifiManager.disableWifi();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "disableWifi get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(2000);
            try{
                let state = wifiManager.isWifiActive();
                hilog.info(domain, tag, "isWifiActive:" + state);
                expect(state).assertFalse();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "isWifiActive get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            try{
                wifiManager.enableWifi();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "enableWifi get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(2000);
            try {
                let states = wifiManager.isWifiActive();
                hilog.info(domain, tag, "isWifiActive:" + states);
                expect(states).assertTrue();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "isWifiActive get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            try{
                wifiManager.offWifiStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(2000);
            done();
        })

        /**
         * @tc.number isConnectedTest
         * @tc.name isConnectedTest
         * @tc.desc Test isConnectedTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("isConnectedTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let state: boolean = wifiManager.isConnected();
                hilog.info(domain, tag, "isConnected:" + state);
                expect(state === true | state === false).assertTrue();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isConnected get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getIpInfoTest
         * @tc.name getIpInfoTest
         * @tc.desc Test getIpInfoTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getIpInfoTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let info: wifiManager.IpInfo = wifiManager.getIpInfo();
                hilog.info(domain, tag, "getIpInfo:" + JSON.stringify(info));
                hilog.info(domain, tag, "getIpInfo ipAddress:" + JSON.stringify(info.ipAddress));
                hilog.info(domain, tag, "getIpInfo gateway:" + JSON.stringify(info.gateway));
                hilog.info(domain, tag, "getIpInfo netmask:" + JSON.stringify(info.netmask));
                hilog.info(domain, tag, "getIpInfo primaryDns:" + JSON.stringify(info.primaryDns));
                hilog.info(domain, tag, "getIpInfo secondDns:" + JSON.stringify(info.secondDns));
                hilog.info(domain, tag, "getIpInfo serverIp:" + JSON.stringify(info.serverIp));
                hilog.info(domain, tag, "getIpInfo leaseDuration:" + JSON.stringify(info.leaseDuration));
                expect(true).assertEqual(info != null);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getIpInfo get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getScanInfoListTest
         * @tc.name getScanInfoListTest
         * @tc.desc Test getScanInfoListTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getScanInfoListTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let infos: Array<wifiManager.WifiScanInfo> = wifiManager.getScanInfoList();
                hilog.info(domain, tag, "getScanInfoList result:" + JSON.stringify(infos));
                hilog.info(domain, tag, "getScanInfoList result length:" + infos.length);
                if (infos.length > 0) {
                    hilog.info(domain, tag, "bssid:" + infos[0]?.bssid);
                    hilog.info(domain, tag, "securityType:" + infos[0]?.securityType);
                    hilog.info(domain, tag, "rssi:" + infos[0]?.rssi);
                    hilog.info(domain, tag, "ssid:" + infos[0]?.ssid);
                    hilog.info(domain, tag, "band:" + infos[0]?.band);
                    hilog.info(domain, tag, "bssidType:" + infos[0]?.bssidType);
                    hilog.info(domain, tag, "supportedWifiCategory:" + infos[0].supportedWifiCategory);
                    hilog.info(domain, tag, "capabilities:" + infos[0]?.capabilities);
                    hilog.info(domain, tag, "frequency:" + infos[0]?.frequency);
                    hilog.info(domain, tag, "channelWidth:" + infos[0]?.channelWidth);
                    hilog.info(domain, tag, "centerFrequency0:" + infos[0]?.centerFrequency0);
                    hilog.info(domain, tag, "centerFrequency1:" + infos[0]?.centerFrequency1);
                    hilog.info(domain, tag, "infoElems:" + JSON.stringify(infos[0]?.infoElems[0]));
                    hilog.info(domain, tag, "infoElems eid:" + infos[0]?.infoElems[0]?.eid);
                    hilog.info(domain, tag, "infoElems content:" + infos[0]?.infoElems[0]?.content);
                    hilog.info(domain, tag, "timestamp:" + infos[0]?.timestamp);
                    hilog.info(domain, tag, "isHiLinkNetwork:" + infos[0]?.isHiLinkNetwork);
                    expect(true).assertEqual(infos.length > 0);
                } else if (infos.length === 0) {
                    hilog.info(domain, tag, "scan get info is null");
                    expect(true).assertEqual(infos.length === 0);
                } else {
                    expect().assertFail();
                }
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "getScanInfoList get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getScanInfoList get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number isMeteredHotspotTest
         * @tc.name isMeteredHotspotTest
         * @tc.desc Test isMeteredHotspotTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("isMeteredHotspotTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let metered: boolean = wifiManager.isMeteredHotspot();
                hilog.info(domain, tag, "isMeteredHotspot:" + JSON.stringify(metered));
                expect(metered).assertFalse();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "isMeteredHotspot get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isMeteredHotspot get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501000);
                }
            }
            done();
        })

        /**
         * @tc.number getIpv6InfoTest
         * @tc.name getIpv6InfoTest
         * @tc.desc Test getIpv6InfoTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getIpv6InfoTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let info: wifiManager.Ipv6Info = wifiManager.getIpv6Info();
                hilog.info(domain, tag, "getIpv6Info:" + JSON.stringify(info));
                hilog.info(domain, tag, "getIpv6Info linkIpv6Address:" + JSON.stringify(info.linkIpv6Address));
                hilog.info(domain, tag, "getIpv6Info globalIpv6Address:" + JSON.stringify(info.globalIpv6Address));
                hilog.info(domain, tag, "getIpv6Info randomGlobalIpv6Address:" + JSON.stringify(info.randomGlobalIpv6Address));
                hilog.info(domain, tag, "getIpv6Info uniqueIpv6Address:" + JSON.stringify(info.uniqueIpv6Address));
                hilog.info(domain, tag, "getIpv6Info randomUniqueIpv6Address:" + JSON.stringify(info.randomUniqueIpv6Address));
                hilog.info(domain, tag, "getIpv6Info gateway:" + JSON.stringify(info.gateway));
                hilog.info(domain, tag, "getIpv6Info netmask:" + JSON.stringify(info.netmask));
                hilog.info(domain, tag, "getIpv6Info primaryDNS:" + JSON.stringify(info.primaryDNS));
                hilog.info(domain, tag, "getIpv6Info secondDNS:" + JSON.stringify(info.secondDNS));
                expect(true).assertEqual(info != null);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getIpv6Info get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getSignalLevelTest
         * @tc.name getSignalLevelTest
         * @tc.desc Test getSignalLevelTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getSignalLevelTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let level: int = wifiManager.getSignalLevel(0 ,0);
                hilog.info(domain, tag, 'getSignalLevel success result:' + level);
                expect(true).assertEqual(level >= 0 && level <= 4);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getSignalLevel get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getLinkedInfoPromiseTest
         * @tc.name getLinkedInfoPromiseTest
         * @tc.desc Test getLinkedInfoPromiseTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getLinkedInfoPromiseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getLinkedInfo().then((data: wifiManager.WifiLinkedInfo) => {
                    hilog.info(domain, tag, 'getLinkedInfo promise success result:' + JSON.stringify(data));
                    hilog.info(domain, tag, 'getLinkedInfo promise success result rssi:' + data.rssi);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result ssid:' + data.ssid);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result bssid:' + data.bssid);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result connState:' + data.connState);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result macAddress:' + data.macAddress);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result band:' + data.band);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result supportedWifiCategory:' + data.supportedWifiCategory);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result linkSpeed:' + data.linkSpeed);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result rxLinkSpeed:' + data.rxLinkSpeed);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result maxSupportedTxLinkSpeed:' + data.maxSupportedTxLinkSpeed);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result maxSupportedRxLinkSpeed:' + data.maxSupportedRxLinkSpeed);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result frequency:' + data.frequency);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result isHidden:' + data.isHidden);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result isRestricted:' + data.isRestricted);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result macType:' + data.macType);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result ipAddress:' + data.ipAddress);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result channelWidth:' + data.channelWidth);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result wifiStandard:' + data.wifiStandard);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result isHiLinkNetwork:' + data.isHiLinkNetwork);
                    hilog.info(domain, tag, 'getLinkedInfo promise success result wifiLinkType:' + data.wifiLinkType);
                    expect(true).assertEqual(data != null);
                    done();
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLinkedInfo promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getLinkedInfoCallbackTest
         * @tc.name getLinkedInfoCallbackTest
         * @tc.desc Test getLinkedInfoCallbackTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getLinkedInfoCallbackTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            wifiManager.getLinkedInfo((err: BusinessError | null, data: wifiManager.WifiLinkedInfo | undefined) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "getLinkedInfo callback get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code === 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code === 801);
                            done();
                        }
                    } else {
                        if (data != null) {
                            hilog.info(domain, tag, 'getLinkedInfo callback success result:' + JSON.stringify(data));
                            hilog.info(domain, tag, 'getLinkedInfo callback success result rssi:' + data?.rssi);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result ssid:' + data?.ssid);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result bssid:' + data?.bssid);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result connState:' + data?.connState);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result macAddress:' + data?.macAddress);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result band:' + data?.band);
                            hilog.info(domain, tag, 'getLinkedInfo callback success result supportedWifiCategory:' + data?.supportedWifiCategory);
                            done();
                        } else {
                            hilog.info(domain, tag, 'getLinkedInfo callback success result:' + JSON.stringify(data));
                            done();
                        }
                    }
                } catch (err) {
                    err = err as BusinessError;
                    hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            })
            done();
        })

        /**
         * @tc.number getP2pLinkedInfoPromiseTest
         * @tc.name getP2pLinkedInfoPromiseTest
         * @tc.desc Test getP2pLinkedInfoPromiseTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pLinkedInfoPromiseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getP2pLinkedInfo().then((data: wifiManager.WifiP2pLinkedInfo) => {
                    hilog.info(domain, tag, 'getP2pLinkedInfo promise success result:' + JSON.stringify(data));
                    hilog.info(domain, tag, 'getP2pLinkedInfo promise success result connectState:' + data.connectState);
                    hilog.info(domain, tag, 'getP2pLinkedInfo promise success result isGroupOwner:' + data.isGroupOwner);
                    hilog.info(domain, tag, 'getP2pLinkedInfo promise success result groupOwnerAddr:' + data.groupOwnerAddr);
                    expect(true).assertEqual(data != null);
                    done();
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getP2pLinkedInfo promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getCurrentGroupPromiseTest
         * @tc.name getCurrentGroupPromiseTest
         * @tc.desc Test getCurrentGroupPromiseTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getCurrentGroupPromiseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getCurrentGroup().then((data: wifiManager.WifiP2pGroupInfo) => {
                    hilog.info(domain, tag, 'getCurrentGroup promise success result:' + JSON.stringify(data));
                    hilog.info(domain, tag, 'getCurrentGroup promise success result isP2pGo:' + data.isP2pGo);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result ownerInfo:' + data.ownerInfo);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result passphrase:' + data.passphrase);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result interfaceName:' + data.interfaceName);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result groupName:' + data.groupName);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result networkId:' + data.networkId);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result frequency:' + data.frequency);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result clientDevices:' + data.clientDevices);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result goIpAddress:' + data.goIpAddress);
                    expect(true).assertEqual(data != null);
                    done();
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getCurrentGroup promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2801000);
                }
            }
            done();
        })

        /**
         * @tc.number getP2pPeerDevicesPromiseTest
         * @tc.name getP2pPeerDevicesPromiseTest
         * @tc.desc Test getP2pPeerDevicesPromiseTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pPeerDevicesPromiseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getP2pPeerDevices().then((data: wifiManager.WifiP2pDevice[]) => {
                    if (data.length != 0) {
                        hilog.info(domain, tag, 'getP2pPeerDevices promise success result:' + JSON.stringify(data[0]));
                        hilog.info(domain, tag, 'getP2pPeerDevices promise success result deviceName:' + data[0]?.deviceName);
                        hilog.info(domain, tag, 'getP2pPeerDevices promise success result deviceAddress:' + data[0]?.deviceAddress);
                        hilog.info(domain, tag, 'getP2pPeerDevices promise success result deviceAddressType:' + data[0]?.deviceAddressType);
                        hilog.info(domain, tag, 'getP2pPeerDevices promise success result primaryDeviceType:' + data[0]?.primaryDeviceType);
                        hilog.info(domain, tag, 'getP2pPeerDevices promise success result deviceStatus:' + data[0]?.deviceStatus);
                        hilog.info(domain, tag, 'getP2pPeerDevices promise success result groupCapabilities:' + data[0]?.groupCapabilities);
                        expect(true).assertEqual(data != null);
                        done();
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getP2pPeerDevices promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getP2pLocalDevicePromiseTest
         * @tc.name getP2pLocalDevicePromiseTest
         * @tc.desc Test getP2pLocalDevicePromiseTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pLocalDevicePromiseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getP2pLocalDevice().then((data: wifiManager.WifiP2pDevice) => {
                    hilog.info(domain, tag, 'getP2pLocalDevice promise success result:' + JSON.stringify(data));
                    expect(true).assertEqual(data != null);
                    done();
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getP2pLocalDevice promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number deviceConfigPromiseTest
         * @tc.name deviceConfigPromiseTest
         * @tc.desc Test deviceConfigPromiseTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("deviceConfigPromiseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
                    "ssid": "publicTest",
                    "bssid": "00:11:22:33:44:55",
                    "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
                    "preSharedKey": "",
                    "isHiddenSsid": false,
                    "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
                };
                let networkNum: int = -1;
                await wifiManager.addDeviceConfig(wifiDeviceConfig).then((netWorkId: int) => {
                    hilog.info(domain, tag, 'addDeviceConfig promise success result:' + JSON.stringify(netWorkId));
                    networkNum = netWorkId;
                    done();
                });
                expect(true).assertEqual(networkNum != -1);
                let config: Array<wifiManager.WifiDeviceConfig> = wifiManager.getDeviceConfigs();
                hilog.info(domain, tag, 'getDeviceConfigs success result:' + JSON.stringify(config));
                if (config.length != 0) {
                    expect(config[((config.length)-1)].ssid).assertEqual("publicTest");
                    let deviceConfig: wifiManager.WifiDeviceConfig = config[((config.length)-1)];
                    hilog.info(domain, tag, 'getDeviceConfigs result ssid:' + deviceConfig.ssid);
                    hilog.info(domain, tag, 'getDeviceConfigs result bssid:' + deviceConfig.bssid);
                    hilog.info(domain, tag, 'getDeviceConfigs result bssidType:' + deviceConfig.bssidType);
                    hilog.info(domain, tag, 'getDeviceConfigs result preSharedKey:' + deviceConfig.preSharedKey);
                    hilog.info(domain, tag, 'getDeviceConfigs result isHiddenSsid:' + deviceConfig.isHiddenSsid);
                    hilog.info(domain, tag, 'getDeviceConfigs result securityType:' + deviceConfig.securityType);
                    hilog.info(domain, tag, 'getDeviceConfigs result creatorUid:' + deviceConfig.creatorUid);
                    hilog.info(domain, tag, 'getDeviceConfigs result netId:' + deviceConfig.netId);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig:' + deviceConfig.eapConfig);
                    let wifiEapConfig: wifiManager.WifiEapConfig | undefined = config[((config.length)-1)].eapConfig;
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig eapMethod:' + wifiEapConfig?.eapMethod);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig phase2Method:' + wifiEapConfig?.phase2Method);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig identity:' + wifiEapConfig?.identity);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig anonymousIdentity:' + wifiEapConfig?.anonymousIdentity);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig password:' + wifiEapConfig?.password);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig caCertAlias:' + wifiEapConfig?.caCertAlias);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig caPath:' + wifiEapConfig?.caPath);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig clientCertAlias:' + wifiEapConfig?.clientCertAlias);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig certEntry:' + wifiEapConfig?.certEntry);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig certPassword:' + wifiEapConfig?.certPassword);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig altSubjectMatch:' + wifiEapConfig?.altSubjectMatch);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig domainSuffixMatch:' + wifiEapConfig?.domainSuffixMatch);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig realm:' + wifiEapConfig?.realm);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig plmn:' + wifiEapConfig?.plmn);
                    hilog.info(domain, tag, 'getDeviceConfigs result eapConfig eapSubId:' + wifiEapConfig?.eapSubId);
                    hilog.info(domain, tag, 'getDeviceConfigs result wapiConfig:' + deviceConfig.wapiConfig);
                    let wifiWapiConfig: wifiManager.WifiWapiConfig | undefined = config[((config.length)-1)].wapiConfig;
                    hilog.info(domain, tag, 'getDeviceConfigs result wapiConfig wapiPskType:' + wifiWapiConfig?.wapiPskType);
                    hilog.info(domain, tag, 'getDeviceConfigs result wapiConfig wapiAsCert:' + wifiWapiConfig?.wapiAsCert);
                    hilog.info(domain, tag, 'getDeviceConfigs result wapiConfig wapiUserCert:' + wifiWapiConfig?.wapiUserCert);
                } else {
                    hilog.info(domain, tag, 'getDeviceConfigs failed');
                }
                hilog.info(domain, tag, 'connectToNetwork start');
                wifiManager.connectToNetwork(networkNum);
                await Utils.msSleep(2000);
                hilog.info(domain, tag, 'disconnect start');
                wifiManager.disconnect();
                await Utils.msSleep(2000);
                hilog.info(domain, tag, 'removeDevice start');
                wifiManager.removeDevice(networkNum);
                await Utils.msSleep(2000);
                let configs: Array<wifiManager.WifiDeviceConfig> = wifiManager.getDeviceConfigs();
                hilog.info(domain, tag, 'getDeviceConfigs success result:' + JSON.stringify(configs));
                if (configs.length != 0) {
                    expect(true).assertEqual(configs[((configs.length)-1)].ssid != "publicTest");
                } else {
                    expect(true).assertEqual(configs.length === 0);
                }
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "DeviceConfig promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number candidateConfigPromiseTest
         * @tc.name candidateConfigPromiseTest
         * @tc.desc Test candidateConfigPromiseTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("candidateConfigPromiseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
                    "ssid": "TEST_OPEN",
                    "bssid": "22:9b:e6:48:1f:5c",
                    "preSharedKey": "",
                    "isHiddenSsid": false,
                    "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
                };
                let networkNum: int = -1;
                await wifiManager.addCandidateConfig(wifiDeviceConfig).then((netWorkId: int) => {
                    hilog.info(domain, tag, 'addCandidateConfig promise success result:' + JSON.stringify(netWorkId));
                    networkNum = netWorkId;
                    done();
                });
                expect(true).assertEqual(networkNum != -1);
                let config: Array<wifiManager.WifiDeviceConfig> = wifiManager.getCandidateConfigs();
                hilog.info(domain, tag, 'getCandidateConfigs success result:' + JSON.stringify(config));
                if (config.length != 0) {
                    expect(config[((config.length)-1)].ssid).assertEqual("TEST_OPEN");
                } else {
                    hilog.info(domain, tag, 'getCandidateConfigs failed');
                }
                hilog.info(domain, tag, 'connectToCandidateConfig start');
                wifiManager.connectToCandidateConfig(networkNum);
                await Utils.msSleep(2000);
                hilog.info(domain, tag, 'disconnect start');
                wifiManager.disconnect();
                await Utils.msSleep(2000);
                await wifiManager.removeCandidateConfig(networkNum).then(() => {
                    hilog.info(domain, tag, 'removeCandidateConfig promise success');
                });
                await Utils.msSleep(2000);
                let configs: Array<wifiManager.WifiDeviceConfig> = wifiManager.getCandidateConfigs();
                hilog.info(domain, tag, 'getCandidateConfigs success result:' + JSON.stringify(configs));
                if (configs.length != 0) {
                    expect(true).assertEqual(configs[((configs.length)-1)].ssid != "TEST_OPEN");
                } else {
                    expect(true).assertEqual(configs.length === 0);
                }
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "CandidateConfig promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                }
            }
            done();
        })

        /**
         * @tc.number getLinkedInfoSyncTest
         * @tc.name getLinkedInfoSyncTest
         * @tc.desc Test getLinkedInfoSyncTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getLinkedInfoSyncTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let infoSync: wifiManager.WifiLinkedInfo = wifiManager.getLinkedInfoSync();
                hilog.info(domain, tag, 'getLinkedInfoSync success result:' + JSON.stringify(infoSync));
                hilog.info(domain, tag, 'getLinkedInfoSync success result rssi:' + infoSync.rssi);
                hilog.info(domain, tag, 'getLinkedInfoSync success result ssid:' + infoSync.ssid);
                hilog.info(domain, tag, 'getLinkedInfoSync success result bssid:' + infoSync.bssid);
                hilog.info(domain, tag, 'getLinkedInfoSync success result connState:' + infoSync.connState);
                expect(true).assertEqual(infoSync.connState === wifiManager.ConnState.SCANNING ||
                    infoSync.connState === wifiManager.ConnState.CONNECTING ||
                    infoSync.connState === wifiManager.ConnState.AUTHENTICATING ||
                    infoSync.connState === wifiManager.ConnState.OBTAINING_IPADDR ||
                    infoSync.connState === wifiManager.ConnState.CONNECTED ||
                    infoSync.connState === wifiManager.ConnState.DISCONNECTING ||
                    infoSync.connState === wifiManager.ConnState.DISCONNECTED ||
                    infoSync.connState === wifiManager.ConnState.UNKNOWN)
                hilog.info(domain, tag, 'getLinkedInfoSync success result macAddress:' + infoSync.macAddress);
                hilog.info(domain, tag, 'getLinkedInfoSync success result band:' + infoSync.band);
                hilog.info(domain, tag, 'getLinkedInfoSync success result supportedWifiCategory:' + infoSync.supportedWifiCategory);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLinkedInfoSync get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getMultiLinkedInfoTest
         * @tc.name getMultiLinkedInfoTest
         * @tc.desc Test getMultiLinkedInfoTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getMultiLinkedInfoTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let multiLinkedInfo: Array<wifiManager.WifiLinkedInfo> = wifiManager.getMultiLinkedInfo();
                hilog.info(domain, tag, 'getMultiLinkedInfo success result:' + JSON.stringify(multiLinkedInfo));
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getMultiLinkedInfo get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2501000);
                }
            }
            done();
        })

        /**
         * @tc.number isFeatureSupportedTest
         * @tc.name isFeatureSupportedTest
         * @tc.desc Test isFeatureSupportedTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("isFeatureSupportedTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let supported: boolean = wifiManager.isFeatureSupported(0);
                hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
                expect(supported).assertTrue();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getDeviceMacAddressTest
         * @tc.name getDeviceMacAddressTest
         * @tc.desc Test getDeviceMacAddressTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getDeviceMacAddressTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let addr: string[] = wifiManager.getDeviceMacAddress();
                hilog.info(domain, tag, 'getDeviceMacAddress success result:' + JSON.stringify(addr));
                expect(true).assertEqual(addr != null);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getDeviceMacAddress get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getCountryCodeTest
         * @tc.name getCountryCodeTest
         * @tc.desc Test getCountryCodeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getCountryCodeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let countryCode: string = wifiManager.getCountryCode();
                hilog.info(domain, tag, 'getCountryCode success result:' + JSON.stringify(countryCode));
                expect(countryCode).assertEqual("CN");
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getCountryCode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number isBandTypeSupportedTest
         * @tc.name isBandTypeSupportedTest
         * @tc.desc Test isBandTypeSupportedTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("isBandTypeSupportedTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let supported: boolean = wifiManager.isBandTypeSupported(wifiManager.WifiBandType.WIFI_BAND_NONE);
                hilog.info(domain, tag, 'isBandTypeSupported success result:' + JSON.stringify(supported));
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isBandTypeSupported get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 401);
                }
            }
            done();
        })

        /**
         * @tc.number p2pGroupTest
         * @tc.name p2pGroupTest
         * @tc.desc Test p2pGroupTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pGroupTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let wifiP2PConfig: wifiManager.WifiP2PConfig = {
                    deviceAddress: "00:11:22:33:44:55",
                    deviceAddressType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
                    netId: -1,
                    passphrase : "12345678",
                    groupName : "createTemporaryP2pGroup",
                    goBand : wifiManager.GroupOwnerBand.GO_BAND_AUTO
                }
                hilog.info(domain, tag, 'createGroup start.');
                wifiManager.createGroup(wifiP2PConfig);
                hilog.info(domain, tag, 'createGroup end.');
                await Utils.msSleep(1000);
                hilog.info(domain, tag, 'getCurrentGroup start.');
                await wifiManager.getCurrentGroup().then((data: wifiManager.WifiP2pGroupInfo) => {
                    hilog.info(domain, tag, 'getCurrentGroup promise success result:' + JSON.stringify(data));
                    hilog.info(domain, tag, 'getCurrentGroup promise success result isP2pGo:' + data.isP2pGo);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result ownerInfo:' + data.ownerInfo);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result passphrase:' + data.passphrase);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result interfaceName:' + data.interfaceName);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result groupName:' + data.groupName);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result networkId:' + data.networkId);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result frequency:' + data.frequency);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result clientDevices:' + data.clientDevices);
                    hilog.info(domain, tag, 'getCurrentGroup promise success result goIpAddress:' + data.goIpAddress);
                    expect(true).assertEqual(data != null);
                    done();
                });
                hilog.info(domain, tag, 'p2pConnect start.');
                wifiManager.p2pConnect(wifiP2PConfig);
                await Utils.msSleep(1000);
                hilog.info(domain, tag, 'p2pCancelConnect start.');
                wifiManager.p2pCancelConnect();
                await Utils.msSleep(1000);
                hilog.info(domain, tag, 'removeGroup start.');
                wifiManager.removeGroup();
                await Utils.msSleep(1000);
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "p2pGroupTest get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                }
            }
            done();
        })

        /**
         * @tc.number isHotspotActiveTest
         * @tc.name isHotspotActiveTest
         * @tc.desc Test isHotspotActiveTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("isHotspotActiveTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let apActive: boolean = wifiManager.isHotspotActive();
                hilog.info(domain, tag, 'isHotspotActive success result:' + JSON.stringify(apActive));
                expect(apActive).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isHotspotActive get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pDiscoverDevicesTest
         * @tc.name p2pDiscoverDevicesTest
         * @tc.desc Test p2pDiscoverDevicesTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pDiscoverDevicesTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                hilog.info(domain, tag, 'startDiscoverDevices start.');
                wifiManager.startDiscoverDevices();
                await Utils.msSleep(1000);
                hilog.info(domain, tag, 'stopDiscoverDevices start.');
                wifiManager.stopDiscoverDevices();
                await Utils.msSleep(1000);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "p2pDiscoverDevicesTest get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number wifiStateChangeTest
         * @tc.name wifiStateChangeTest
         * @tc.desc Test wifiStateChangeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("wifiStateChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo state result:" + changeInfo);
            }
            try{
                wifiManager.onWifiStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offWifiStateChange();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number wifiStateChangeTest2
         * @tc.name wifiStateChangeTest2
         * @tc.desc Test wifiStateChangeTest2 API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("wifiStateChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo state result:" + changeInfo);
            }
            try{
                wifiManager.onWifiStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offWifiStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pDiscoveryChangeTest
         * @tc.name p2pDiscoveryChangeTest
         * @tc.desc Test p2pDiscoveryChangeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pDiscoveryChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDiscoveryChange:" + changeInfo);
            }
            try{
                wifiManager.onP2pDiscoveryChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pDiscoveryChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pDiscoveryChange();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pDiscoveryChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pDiscoveryChangeTest2
         * @tc.name p2pDiscoveryChangeTest2
         * @tc.desc Test p2pDiscoveryChangeTest2 API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pDiscoveryChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDiscoveryChange:" + changeInfo);
            }
            try{
                wifiManager.onP2pDiscoveryChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pDiscoveryChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pDiscoveryChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pDiscoveryChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pPersistentGroupChangeTest
         * @tc.name p2pPersistentGroupChangeTest
         * @tc.desc Test p2pPersistentGroupChangeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pPersistentGroupChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent = () => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pPersistentGroupChange");
            }
            try{
                wifiManager.onP2pPersistentGroupChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pPersistentGroupChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pPersistentGroupChange();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pPersistentGroupChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pPersistentGroupChangeTest2
         * @tc.name p2pPersistentGroupChangeTest2
         * @tc.desc Test p2pPersistentGroupChangeTest2 API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pPersistentGroupChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent = () => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pPersistentGroupChange");
            }
            try{
                wifiManager.onP2pPersistentGroupChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pPersistentGroupChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pPersistentGroupChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pPersistentGroupChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pPeerDeviceChangeTest
         * @tc.name p2pPeerDeviceChangeTest
         * @tc.desc Test p2pPeerDeviceChangeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pPeerDeviceChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: wifiManager.WifiP2pDevice[]) => void = (changeInfo: wifiManager.WifiP2pDevice[]) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pPeerDeviceChange:" + changeInfo);
            }
            try{
                wifiManager.onP2pPeerDeviceChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pPeerDeviceChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pPeerDeviceChange();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pPeerDeviceChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pPeerDeviceChangeTest2
         * @tc.name p2pPeerDeviceChangeTest2
         * @tc.desc Test p2pPeerDeviceChangeTest2 API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pPeerDeviceChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: wifiManager.WifiP2pDevice[]) => void = (changeInfo: wifiManager.WifiP2pDevice[]) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pPeerDeviceChange:" + changeInfo);
            }
            try{
                wifiManager.onP2pPeerDeviceChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pPeerDeviceChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pPeerDeviceChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pPeerDeviceChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number wifiScanStateChangeTest
         * @tc.name wifiScanStateChangeTest
         * @tc.desc Test wifiScanStateChangeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("wifiScanStateChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo wifiScanStateChange:" + changeInfo);
            }
            try{
                wifiManager.onWifiScanStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiScanStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offWifiScanStateChange();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiScanStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number wifiScanStateChangeTest2
         * @tc.name wifiScanStateChangeTest2
         * @tc.desc Test wifiScanStateChangeTest2 API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("wifiScanStateChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo wifiScanStateChange:" + changeInfo);
            }
            try{
                wifiManager.onWifiScanStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiScanStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offWifiScanStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiScanStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number wifiConnectionChangeTest
         * @tc.name wifiConnectionChangeTest
         * @tc.desc Test wifiConnectionChangeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("wifiConnectionChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo wifiConnectionChange:" + changeInfo);
            }
            try{
                wifiManager.onWifiConnectionChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiConnectionChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offWifiConnectionChange();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiConnectionChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number wifiConnectionChangeTest2
         * @tc.name wifiConnectionChangeTest2
         * @tc.desc Test wifiConnectionChangeTest2 API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("wifiConnectionChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo wifiConnectionChange:" + changeInfo);
            }
            try{
                wifiManager.onWifiConnectionChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiConnectionChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offWifiConnectionChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiConnectionChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pDeviceChangeTest
         * @tc.name p2pDeviceChangeTest
         * @tc.desc Test p2pDeviceChangeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pDeviceChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: wifiManager.WifiP2pDevice) => void = (changeInfo: wifiManager.WifiP2pDevice) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange:" + changeInfo);
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange deviceName:" + changeInfo.deviceName);
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange deviceAddress:" + changeInfo.deviceAddress);
                if (changeInfo.deviceAddressType != null) {
                    hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange deviceAddressType:" + changeInfo?.deviceAddressType);
                    expect(true).assertEqual(changeInfo.deviceAddressType === wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS ||
                        changeInfo.deviceAddressType === wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS);
                }
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange primaryDeviceType:" + changeInfo.primaryDeviceType);
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange deviceStatus:" + changeInfo.deviceStatus);
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange groupCapabilities:" + changeInfo.groupCapabilities);
            }
            try{
                wifiManager.onP2pDeviceChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pDeviceChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pDeviceChange();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pDeviceChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pDeviceChangeTest2
         * @tc.name p2pDeviceChangeTest2
         * @tc.desc Test p2pDeviceChangeTest2 API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pDeviceChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: wifiManager.WifiP2pDevice) => void = (changeInfo: wifiManager.WifiP2pDevice) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange:" + changeInfo);
            }
            try{
                wifiManager.onP2pDeviceChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pDeviceChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pDeviceChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pDeviceChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pConnectionChangeTest
         * @tc.name p2pConnectionChangeTest
         * @tc.desc Test p2pConnectionChangeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pConnectionChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: wifiManager.WifiP2pLinkedInfo) => void = (changeInfo: wifiManager.WifiP2pLinkedInfo) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pConnectionChange:" + changeInfo);
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pConnectionChange connectState:" + changeInfo.connectState);
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pConnectionChange isGroupOwner:" + changeInfo.isGroupOwner);
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pConnectionChange groupOwnerAddr:" + changeInfo.groupOwnerAddr);
            }
            try{
                wifiManager.onP2pConnectionChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pConnectionChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pConnectionChange();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pConnectionChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pConnectionChangeTest2
         * @tc.name p2pConnectionChangeTest2
         * @tc.desc Test p2pConnectionChangeTest2 API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pConnectionChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: wifiManager.WifiP2pLinkedInfo) => void = (changeInfo: wifiManager.WifiP2pLinkedInfo) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pConnectionChange:" + changeInfo);
            }
            try{
                wifiManager.onP2pConnectionChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pConnectionChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pConnectionChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pConnectionChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pStateChangeTest
         * @tc.name p2pStateChangeTest
         * @tc.desc Test p2pStateChangeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pStateChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pStateChange:" + changeInfo);
            }
            try{
                wifiManager.onP2pStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pStateChange();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number p2pStateChangeTest2
         * @tc.name p2pStateChangeTest2
         * @tc.desc Test p2pStateChangeTest2 API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("p2pStateChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo p2pStateChange:" + changeInfo);
            }
            try{
                wifiManager.onP2pStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offP2pStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "p2pStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number hotspotStateChangeTest
         * @tc.name hotspotStateChangeTest
         * @tc.desc Test hotspotStateChangeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("hotspotStateChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo hotspotStateChange:" + changeInfo);
            }
            try{
                wifiManager.onHotspotStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "hotspotStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offHotspotStateChange();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "hotspotStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number hotspotStateChangeTest2
         * @tc.name hotspotStateChangeTest2
         * @tc.desc Test hotspotStateChangeTest2 API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("hotspotStateChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo hotspotStateChange:" + changeInfo);
            }
            try{
                wifiManager.onHotspotStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "hotspotStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offHotspotStateChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "hotspotStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number wifiRssiChangeTest
         * @tc.name wifiRssiChangeTest
         * @tc.desc Test wifiRssiChangeTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("wifiRssiChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo wifiRssiChange:" + changeInfo);
            }
            try{
                wifiManager.onWifiRssiChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiRssiChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offWifiRssiChange();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiRssiChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number wifiRssiChangeTest2
         * @tc.name wifiRssiChangeTest2
         * @tc.desc Test wifiRssiChangeTest2 API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("wifiRssiChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo wifiRssiChange:" + changeInfo);
            }
            try{
                wifiManager.onWifiRssiChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiRssiChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                wifiManager.offWifiRssiChange(onReceiveEvent);
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "wifiRssiChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getCurrentGroupCallbackTest
         * @tc.name getCurrentGroupCallbackTest
         * @tc.desc Test getCurrentGroupCallbackTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getCurrentGroupCallbackTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await CallbackMethods.getCurrentGroupCallback().then((data: wifiManager.WifiP2pGroupInfo) => {
                    hilog.info(domain, tag, 'getCurrentGroupCallback success result:' + JSON.stringify(data));
                });
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(err.code).assertEqual(2801000);
                }
            }
            done();
        })

        /**
         * @tc.number getP2pLinkedInfoCallbackTest
         * @tc.name getP2pLinkedInfoCallbackTest
         * @tc.desc Test getP2pLinkedInfoCallbackTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pLinkedInfoCallbackTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await CallbackMethods.getP2pLinkedInfoCallback().then((data: wifiManager.WifiP2pLinkedInfo) => {
                    hilog.info(domain, tag, 'getP2pLinkedInfoCallback success result:' + JSON.stringify(data));
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getP2pPeerDevicesCallbackTest
         * @tc.name getP2pPeerDevicesCallbackTest
         * @tc.desc Test getP2pPeerDevicesCallbackTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pPeerDevicesCallbackTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await CallbackMethods.getP2pPeerDevicesCallback().then((data: wifiManager.WifiP2pDevice[]) => {
                    hilog.info(domain, tag, 'getP2pPeerDevicesCallback success result:' + JSON.stringify(data));
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number getP2pLocalDeviceCallbackTest
         * @tc.name getP2pLocalDeviceCallbackTest
         * @tc.desc Test getP2pLocalDeviceCallbackTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("getP2pLocalDeviceCallbackTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await CallbackMethods.getP2pLocalDeviceCallback().then((data: wifiManager.WifiP2pDevice) => {
                    hilog.info(domain, tag, 'getP2pLocalDeviceCallback success result:' + JSON.stringify(data));
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number deviceConfigCallbackTest
         * @tc.name deviceConfigCallbackTest
         * @tc.desc Test deviceConfigCallbackTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("deviceConfigCallbackTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let networkNum: int = -1;
            try {
                await CallbackMethods.addDeviceConfigCallback().then((data: int) => {
                    hilog.info(domain, tag, 'addDeviceConfigCallback success result:' + JSON.stringify(data));
                    networkNum = data;
                    done();
                });
                hilog.info(domain, tag, 'addDeviceConfigCallback success networkNum result:' + JSON.stringify(networkNum));
                expect(true).assertEqual(networkNum != -1);
                let config: Array<wifiManager.WifiDeviceConfig> = wifiManager.getDeviceConfigs();
                hilog.info(domain, tag, 'getDeviceConfigs success result:' + JSON.stringify(config));
                if (config.length != 0) {
                    expect(config[((config.length)-1)].ssid).assertEqual("publicTest");
                } else {
                    hilog.info(domain, tag, 'getDeviceConfigs failed');
                    expect().assertFail();
                }
                hilog.info(domain, tag, 'removeDevice start');
                wifiManager.removeDevice(networkNum);
                await Utils.msSleep(2000);
                let configs: Array<wifiManager.WifiDeviceConfig> = wifiManager.getDeviceConfigs();
                hilog.info(domain, tag, 'getDeviceConfigs success result:' + JSON.stringify(configs));
                if (configs.length != 0) {
                    expect(true).assertEqual(configs[((configs.length)-1)].ssid != "publicTest");
                } else {
                    expect(true).assertEqual(configs.length === 0);
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, 'use api get err:' + JSON.stringify(err));
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })
        /**
         * @tc.number candidateConfigCallbackTest
         * @tc.name candidateConfigCallbackTest
         * @tc.desc Test candidateConfigCallbackTest API functionality
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("candidateConfigCallbackTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let networkNum: int = -1;
            try {
                await CallbackMethods.addCandidateConfigCallback().then((data: int) => {
                    hilog.info(domain, tag, 'addCandidateConfigCallback success result:' + JSON.stringify(data));
                    networkNum = data;
                    done();
                });
                hilog.info(domain, tag, 'addCandidateConfigCallback success networkNum result:' + JSON.stringify(networkNum));
                expect(networkNum != -1).assertTrue();
                await CallbackMethods.removeCandidateConfigCallback(networkNum).then((data: boolean) => {
                    hilog.info(domain, tag, 'removeCandidateConfigCallback success');
                    expect(data).assertTrue();
                    done();
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, 'use api get err:' + JSON.stringify(err));
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                }
            }
            done();
        })
    })
}