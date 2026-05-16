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
export default function HiRetrievalQuitTest() {
    describe("HiRetrievalQuitTest", (): void => {
        /**
         * @tc.name   testHiRetrievalQuit_0100
         * @tc.number SUB_DFX_DFT_HiRetrieval_Quit_0100
         * @tc.desc   验证quit正常调用，退出HiRetrieval项目
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalQuit_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalQuit_0100 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                hiRetrieval.quit();
                hilog.info(0x0000, 'testTag', 'HiRetrieval quit success');
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalQuit_0100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalQuit_0200
         * @tc.number SUB_DFX_DFT_HiRetrieval_Quit_0200
         * @tc.desc   验证quit在未调用init时调用，抛出错误码36000001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHiRetrievalQuit_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalQuit_0200 Test start***********');
            try {
                hiRetrieval.quit();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(0x0000, 'testTag', 'error code: %{public}d', err.code);
                let res:number = (typeof err.code === 'number') ? err.code : Number(err.code) 
                expect(res === 36000001).assertTrue();
            }
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalQuit_0200 Test end***********');
        });

        /**
         * @tc.name   testHiRetrievalQuit_0300
         * @tc.number SUB_DFX_DFT_HiRetrieval_Quit_0300
         * @tc.desc   验证quit重复调用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalQuit_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalQuit_0300 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                hiRetrieval.quit();
                hiRetrieval.init();
                hiRetrieval.quit();
                hilog.info(0x0000, 'testTag', 'HiRetrieval quit success');
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalQuit_0300 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });
    })
}
