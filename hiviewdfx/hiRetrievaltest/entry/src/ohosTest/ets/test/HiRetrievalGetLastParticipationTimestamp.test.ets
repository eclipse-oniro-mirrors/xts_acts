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

export default function HiRetrievalGetLastParticipationTimestampTest() {
    describe("HiRetrievalGetLastParticipationTimestampTest", (): void => {
        /**
         * @tc.name   testHiRetrievalGetLastParticipationTimestamp_0100
         * @tc.number SUB_DFX_DFT_HiRetrieval_GetLastParticipationTimestamp_0100
         * @tc.desc   验证getLastParticipationTimestamp正常调用，查询最后参与时间戳
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalGetLastParticipationTimestamp_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetLastParticipationTimestamp_0100 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                let timestamp = hiRetrieval.getLastParticipationTimestamp();
                hilog.info(0x0000, 'testTag', 'timestamp: %{public}d', timestamp);
                expect(timestamp > 0).assertTrue();
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetLastParticipationTimestamp_0100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalGetLastParticipationTimestamp_0300
         * @tc.number SUB_DFX_DFT_HiRetrieval_GetLastParticipationTimestamp_0300
         * @tc.desc   验证getLastParticipationTimestamp在未调用participate时调用，返回0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalGetLastParticipationTimestamp_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetLastParticipationTimestamp_0300 Test start***********');
            try {
                hiRetrieval.init();
                let timestamp = hiRetrieval.getLastParticipationTimestamp();
                hilog.info(0x0000, 'testTag', 'timestamp: %{public}d', timestamp);
                expect(timestamp >= 0).assertTrue();
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetLastParticipationTimestamp_0300 Test end***********');
            } catch (err) {
                hilog.error(0x000000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalGetLastParticipationTimestamp_0400
         * @tc.number SUB_DFX_DFT_HiRetrieval_GetLastParticipationTimestamp_0400
         * @tc.desc   验证getLastParticipationTimestamp在quit后调用，返回0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalGetLastParticipationTimestamp_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetLastParticipationTimestamp_0400 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                hiRetrieval.quit();
                let timestamp = hiRetrieval.getLastParticipationTimestamp();
                hilog.info(0x0000, 'testTag', 'timestamp: %{public}d', timestamp);
                expect(timestamp > 0).assertTrue();
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetLastParticipationTimestamp_0400 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalGetLastParticipationTimestamp_0500
         * @tc.number SUB_DFX_DFT_HiRetrieval_GetLastParticipationTimestamp_0500
         * @tc.desc   验证getLastParticipationTimestamp返回值类型为long
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalGetLastParticipationTimestamp_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetLastParticipationTimestamp_0500 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                let timestamp = hiRetrieval.getLastParticipationTimestamp();
                hilog.info(0x0000, 'testTag', 'timestamp type: %{public}s', typeof timestamp);
                hilog.info(0x0000, 'testTag', 'timestamp value: %{public}d', timestamp);
                expect(typeof timestamp == 'bigint').assertTrue();
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalGetLastParticipationTimestamp_0500 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });
    })
}
