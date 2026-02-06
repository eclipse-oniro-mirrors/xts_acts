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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import wifiManager from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiDisableTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function wifiDisableTest() {

    describe("wifiDisableTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            await Utils.closeWifi();
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        /**
         * @tc.name   isMeteredHotspotErrCode2501001Test
         * @tc.number isMeteredHotspotErrCode2501001Test
         * @tc.desc   Test isMeteredHotspotErrCode2501001Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("isMeteredHotspotErrCode2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                let metered: boolean = wifiManager.isMeteredHotspot();
                hilog.info(domain, tag, "isMeteredHotspot:" + metered);
                expect().assertFail();
            }catch(err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isMeteredHotspot get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2501001);
                }
            }
            done();
        })

        /**
         * @tc.name   getLinkedInfoPromise2501001Test
         * @tc.number getLinkedInfoPromise2501001Test
         * @tc.desc   Test getLinkedInfoPromise2501001Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getLinkedInfoPromise2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await wifiManager.getLinkedInfo().then((data: wifiManager.WifiLinkedInfo) => {});
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLinkedInfo promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2501001);
                }
            }
            done();
        })

        /**
         * @tc.name   getLinkedInfoCallback2501001Test
         * @tc.number getLinkedInfoCallback2501001Test
         * @tc.desc   Test getLinkedInfoCallback2501001Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getLinkedInfoCallback2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                            expect(true).assertEqual(err?.code == 2501001);
                            done();
                        }
                    } else {
                        expect().assertFail();
                        done();
                    }
                } catch (err) {
                    hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                    done();
                }
            })
            done();
        })

        /**
         * @tc.name   getLinkedInfoSync2501001Test
         * @tc.number getLinkedInfoSync2501001Test
         * @tc.desc   Test getLinkedInfoSync2501001Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getLinkedInfoSync2501001Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let infoSync: wifiManager.WifiLinkedInfo = wifiManager.getLinkedInfoSync();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLinkedInfoSync get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2501001);
                }
            }
            done();
        })
    })
}