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
export default function HiRetrievalIsParticipantTest() {
    describe("HiRetrievalIsParticipantTest", (): void => {

        /**
         * @tc.name   testHiRetrievalIsParticipant_0300
         * @tc.number SUB_DFX_DFT_HiRetrieval_IsParticipant_0300
         * @tc.desc   验证isParticipant在quit后调用，返回false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalIsParticipant_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalIsParticipant_0300 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                hiRetrieval.quit();
                let isParticipating = hiRetrieval.isParticipant();
                hilog.info(0x0000, 'testTag', 'isParticipant: %{public}s', isParticipating.toString());
                expect(isParticipating).assertFalse();
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalIsParticipant_0300 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalIsParticipant_0400
         * @tc.number SUB_DFX_DFT_HiRetrieval_IsParticipant_0400
         * @tc.desc   验证isParticipant在未调用participate时调用，返回false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalIsParticipant_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalIsParticipant_0400 Test start***********');
            try {
                hiRetrieval.init();
                let isParticipating = hiRetrieval.isParticipant();
                hilog.info(0x0000, 'testTag', 'isParticipant: %{public}s', isParticipating.toString());
                expect(isParticipating).assertFalse();
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalIsParticipant_0400 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });
        /**
         * @tc.name   testHiRetrievalIsParticipant_0100
         * @tc.number SUB_DFX_DFT_HiRetrieval_IsParticipant_0100
         * @tc.desc   验证isParticipant正常调用，查询是否参与HiRetrieval项目
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalIsParticipant_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalIsParticipant_0100 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                let isParticipating = hiRetrieval.isParticipant();
                hilog.info(0x0000, 'testTag', 'isParticipant: %{public}s', isParticipating.toString());
                expect(isParticipating).assertTrue();
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalIsParticipant_0100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });
    })
}
