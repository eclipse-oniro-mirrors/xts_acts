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
export default function HiRetrievalParticipateTest() {
    describe("HiRetrievalParticipateTest", (): void => {
        /**
         * @tc.name   testHiRetrievalParticipate_0200
         * @tc.number SUB_DFX_DFT_HiRetrieval_Participate_0200
         * @tc.desc   验证participate在未调用init时调用，抛出错误码36000001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHiRetrievalParticipate_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0200 Test start***********');
            try {
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(0x0000, 'testTag', 'error code: %{public}d', err.code);
                let res:number = (typeof err.code === 'number') ? err.code : Number(err.code) 
                expect(res === 36000001).assertTrue();
            }
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0200 Test end***********');
        });

        /**
         * @tc.name   testHiRetrievalParticipate_0100
         * @tc.number SUB_DFX_DFT_HiRetrieval_Participate_0100
         * @tc.desc   验证participate正常调用，参与HiRetrieval项目
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * * @tc.level  LEVEL0
         */
        it('testHiRetrievalParticipate_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0100 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                hilog.info(0x0000, 'testTag', 'HiRetrieval participate success');
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });





        /**
         * @tc.name   testHiRetrievalParticipate_0300
         * @tc.number SUB_DFX_DFT_HiRetrieval_Participate_0300
         * @tc.desc   验证participate传入空字符串参数
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalParticipate_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0300 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "",
                    deviceType: "",
                    deviceModel: ""
                };
                hiRetrieval.participate(config);
                hilog.info(0x0000, 'testTag', 'HiRetrieval participate success');
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0300 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalParticipate_0400
         * @tc.number SUB_DFX_DFT_HiRetrieval_Participate_0400
         * @tc.desc   验证participate传入长字符串参数
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalParticipate_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0400 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "veryLongUserTypeStringForTestingPurpose123456789",
                    deviceType: "veryLongDeviceTypeStringForTestingPurpose123456789",
                    deviceModel: "veryLongDeviceModelStringForTestingPurpose123456789"
                };
                hiRetrieval.participate(config);
                hilog.info(0x0000, 'testTag', 'HiRetrieval participate success');
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0400 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalParticipate_0500
         * @tc.number SUB_DFX_DFT_HiRetrieval_Participate_0500
         * @tc.desc   验证participate传入特殊字符参数
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalParticipate_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0500 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "test@#$%^&*()",
                    deviceType: "device!@#$%^&*()",
                    deviceModel: "model~!@#$%^&*()"
                };
                hiRetrieval.participate(config);
                hilog.info(0x0000, 'testTag', 'HiRetrieval participate success');
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0500 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalParticipate_0600
         * @tc.number SUB_DFX_DFT_HiRetrieval_Participate_0600
         * @tc.desc   验证participate重复调用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHiRetrievalParticipate_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0600 Test start***********');
            try {
                hiRetrieval.init();
                let config: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser",
                    deviceType: "testDevice",
                    deviceModel: "testModel"
                };
                hiRetrieval.participate(config);
                let config2: hiRetrieval.HiRetrievalConfig = {
                    userType: "testUser2",
                    deviceType: "testDevice2",
                    deviceModel: "testModel2"
                };
                hiRetrieval.participate(config2);
                hilog.info(0x0000, 'testTag', 'HiRetrieval participate success');
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0600 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
         * @tc.name   testHiRetrievalParticipate_0700
         * @tc.number SUB_DFX_DFT_HiRetrieval_Participate_0700
         * @tc.desc   验证传入null返回401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * * @tc.level  LEVEL0
         */
        it('testHiRetrievalParticipate_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0700 Test start***********');
            try {
                hiRetrieval.init();
                hiRetrieval.participate(null);
                hilog.info(0x0000, 'testTag', 'HiRetrieval participate success');
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0700 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                let res:number = (typeof err.code === 'number') ? err.code : Number(err.code) 
                expect(res === 401).assertTrue();
            }
        });

        /**
         * @tc.name   testHiRetrievalParticipate_0800
         * @tc.number SUB_DFX_DFT_HiRetrieval_Participate_0800
         * @tc.desc   验证传入undefined返回401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * * @tc.level  LEVEL0
         */
        it('testHiRetrievalParticipate_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0800 Test start***********');
            try {
                hiRetrieval.init();
                hiRetrieval.participate(undefined);
                hilog.info(0x0000, 'testTag', 'HiRetrieval participate success');
                hilog.info(0x0000, 'testTag', '*********** testHiRetrievalParticipate_0800 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                let res:number = (typeof err.code === 'number') ? err.code : Number(err.code) 
                expect(res === 401).assertTrue();
            }
        });
    })
}
