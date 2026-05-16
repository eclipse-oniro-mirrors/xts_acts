/*
 * Copyright (c)2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import hilog from '@ohos.hilog'

import { BusinessError } from '@ohos.base';

import { hiAppEvent,hiRetrieval } from "@kit.PerformanceAnalysisKit";

export default function HiRetrievalGetCurrentConfigTest() {
    describe("HiRetrievalGetCurrentConfigTest", (): void => {
        /**
         * @tc.name   testHiRetrievalGetCurrentConfig_0100
         * @tc.number SUB_DFX_DFT_HiRetrieval_GetCurrentConfig_0100
         * @tc.desc   验证getCurrentConfig正常调用，查询当前HiRetrieval配置
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalGetCurrentConfig_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetCurrentConfig_0100 Test start***********');
            try {

                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                let currentConfig = hiRetrieval.getCurrentConfig();
                hilog.info(0x0000, 'testTag', 'userType: %{public}s', currentConfig.userType);
                hilog.info(0x0000, 'testTag', 'deviceType: %{public}s', currentConfig.deviceType);
                hilog.info(0x0000, 'testTag', 'deviceModel: %{public}s', currentConfig.deviceModel);
                expect(currentConfig.userType === "testUser").assertTrue();
                expect(currentConfig.deviceType === "testDevice").assertTrue();
                expect(currentConfig.deviceModel === "testModel").assertTrue();
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetCurrentConfig_0100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalGetCurrentConfig_0300
         * @tc.number SUB_DFX_DFT_HiRetrieval_GetCurrentConfig_0300
         * @tc.desc   验证getCurrentConfig在未调用participate时调用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalGetCurrentConfig_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetCurrentConfig_0300 Test start***********');
            try {
                hiRetrieval.init();
                let currentConfig = hiRetrieval.getCurrentConfig();
                hilog.info(0x0000, 'testTag', 'userType: %{public}s', currentConfig.userType);
                hilog.info(0x0000, 'testTag', 'deviceType: %{public}s', currentConfig.deviceType);
                hilog.info(0x0000, 'testTag', 'deviceModel: %{public}s', currentConfig.deviceModel);
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetCurrentConfig_0300 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalGetCurrentConfig_0400
         * @tc.number SUB_DFX_DFT_HiRetrieval_GetCurrentConfig_0400
         * @tc.desc   验证getCurrentConfig在quit后调用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalGetCurrentConfig_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetCurrentConfig_0400 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                hiRetrieval.quit();
                let currentConfig = hiRetrieval.getCurrentConfig();
                hilog.info(0x0000, 'testTag', 'userType: %{public}s', currentConfig.userType);
                hilog.info(0x0000, 'testTag', 'deviceType: %{public}s', currentConfig.deviceType);
                hilog.info(0x0000, 'testTag', 'deviceModel: %{public}s', currentConfig.deviceModel);
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetCurrentConfig_0400 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalGetCurrentConfig_0500
         * @tc.number SUB_DFX_DFT_HiRetrieval_GetCurrentConfig_0500
         * @tc.desc   验证getCurrentConfig返回值类型为HiRetrievalConfig
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalGetCurrentConfig_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetCurrentConfig_0500 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                let currentConfig = hiRetrieval.getCurrentConfig();
                hilog.info(0x0000, 'testTag', 'config type: %{public}s', typeof currentConfig);
                hilog.info(0x0000, 'testTag', 'config.userType type: %{public}s', typeof currentConfig.userType);
                hilog.info(0x0000, 'testTag', 'config.deviceType type: %{public}s', typeof currentConfig.deviceType);
                hilog.info(0x0000, 'testTag', 'config.deviceModel type: %{public}s', typeof currentConfig.deviceModel);
                expect(typeof currentConfig === 'object').assertTrue();
                expect(typeof currentConfig.userType === 'string').assertTrue();
                expect(typeof currentConfig.deviceType === 'string').assertTrue();
                expect(typeof currentConfig.deviceModel === 'string').assertTrue();
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetCurrentConfig_0500 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalGetCurrentConfig_0600
         * @tc.number SUB_DFX_DFT_HiRetrieval_GetCurrentConfig_0600
         * @tc.desc   验证getCurrentConfig返回的配置值与设置的一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalGetCurrentConfig_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetCurrentConfig_0600 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser123",
                    deviceType: "testDevice456",
                    deviceModel: "testModel789"
                };
                hiRetrieval.participate(config);
                let currentConfig = hiRetrieval.getCurrentConfig();
                expect(currentConfig.userType === "testUser123").assertTrue();
                expect(currentConfig.deviceType === "testDevice456").assertTrue();
                expect(currentConfig.deviceModel === "testModel789").assertTrue();
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetCurrentConfig_0600 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });
    })
}
