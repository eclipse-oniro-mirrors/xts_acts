/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
         * @tc.name   enableWifiErrCode201Test
         * @tc.number enableWifiErrCode201Test
         * @tc.desc   Test enableWifiErrCode201Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("enableWifiErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                wifiManager.enableWifi();
                expect().assertFail();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "enableWifi get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.name   disableWifiErrCode201Test
         * @tc.number disableWifiErrCode201Test
         * @tc.desc   Test disableWifiErrCode201Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("disableWifiErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                wifiManager.disableWifi();
                expect().assertFail();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableWifi get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.name   isConnectedErrCode201Test
         * @tc.number isConnectedErrCode201Test
         * @tc.desc   Test isConnectedErrCode201Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("isConnectedErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let state = wifiManager.isConnected();
                hilog.info(domain, tag, "isConnected get:" + state);
                expect().assertFail();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isConnected get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.name   getIpInfoErrCode201Test
         * @tc.number getIpInfoErrCode201Test
         * @tc.desc   Test getIpInfoErrCode201Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getIpInfoErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let info: wifiManager.IpInfo = wifiManager.getIpInfo();
                hilog.info(domain, tag, "getIpInfo get:" + info);
                expect().assertFail();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getIpInfo get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.name   getScanInfoListErrCode201Test
         * @tc.number getScanInfoListErrCode201Test
         * @tc.desc   Test getScanInfoListErrCode201Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getScanInfoListErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let info: Array<wifiManager.WifiScanInfo> = wifiManager.getScanInfoList();
                hilog.info(domain, tag, "getScanInfoList get:" + info);
                expect().assertFail();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getScanInfoList get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.name   isMeteredHotspotErrCode201Test
         * @tc.number isMeteredHotspotErrCode201Test
         * @tc.desc   Test isMeteredHotspotErrCode201Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("isMeteredHotspotErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let metered = wifiManager.isMeteredHotspot();
                hilog.info(domain, tag, "isMeteredHotspot get:" + metered);
                expect().assertFail();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isMeteredHotspot get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.name   getIpv6InfoErrCode201Test
         * @tc.number getIpv6InfoErrCode201Test
         * @tc.desc   Test getIpv6InfoErrCode201Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getIpv6InfoErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let info: wifiManager.Ipv6Info = wifiManager.getIpv6Info();
                hilog.info(domain, tag, "getIpv6Info get:" + info);
                expect().assertFail();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getIpv6Info get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.name   getSignalLevelErrCode201Test
         * @tc.number getSignalLevelErrCode201Test
         * @tc.desc   Test getSignalLevelErrCode201Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getSignalLevelErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let level: number = wifiManager.getSignalLevel(0 ,0);
                hilog.info(domain, tag, 'getSignalLevel success result:' + level);
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getSignalLevel get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })
        /**
         * @tc.name   getLinkedInfoPromise201Test
         * @tc.number getLinkedInfoPromise201Test
         * @tc.desc   Test getLinkedInfoPromise201Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getLinkedInfoPromise201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getLinkedInfo().then((data: wifiManager.WifiLinkedInfo) => {});
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLinkedInfo promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.name   getLinkedInfoCallback201Test
         * @tc.number getLinkedInfoCallback201Test
         * @tc.desc   Test getLinkedInfoCallback201Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getLinkedInfoCallback201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            wifiManager.getLinkedInfo((err: BusinessError | null, data: wifiManager.WifiLinkedInfo| undefined) => {
                try {
                    if (err != null) {
                        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                        hilog.info(domain, tag, "getLinkedInfo promise get errCode:" + err?.code + ",errMessage:" + err?.message);
                        if (err?.code == 801) {
                            hilog.info(domain, tag, 'api is not support');
                            expect(true).assertEqual(err?.code == 801);
                            done();
                        } else {
                            expect(true).assertEqual(err?.code == 201);
                            done();
                        }
                    } else {
                        expect().assertFail();
                        done();
                    }
                } catch (err :BusinessError) {
                    hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                    done();
                }
            })
            done();
        })

        /**
         * @tc.name   getLinkedInfoSync201Test
         * @tc.number getLinkedInfoSync201Test
         * @tc.desc   Test getLinkedInfoSync201Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getLinkedInfoSync201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let infoSync: wifiManager.WifiLinkedInfo = wifiManager.getLinkedInfoSync();
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLinkedInfoSync get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })
    })
}