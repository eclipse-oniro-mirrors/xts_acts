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

export default function HiRetrievalInitTest() {
    describe("HiRetrievalInitTest", (): void => {
        /**
         * @tc.name   testHiRetrievalInit_0100
         * @tc.number SUB_DFX_DFT_HiRetrieval_Init_0100
         * @tc.desc   验证init正常调用，初始化HiRetrieval功能
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalInit_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalInit_0100 Test start***********');
            try {
                hiRetrieval.init();
                hilog.info(0x0000, 'testTag', 'HiRetrieval init success');
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalInit_0100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalInit_0200
         * @tc.number SUB_DFX_DFT_HiRetrieval_Init_0200
         * @tc.desc   验证init重复调用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalInit_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalInit_0200 Test start***********');
            try {
                hiRetrieval.init();
                hiRetrieval.init();
                hilog.info(0x0000, 'testTag', 'HiRetrieval init success');
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalInit_0200 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });
    })
}
