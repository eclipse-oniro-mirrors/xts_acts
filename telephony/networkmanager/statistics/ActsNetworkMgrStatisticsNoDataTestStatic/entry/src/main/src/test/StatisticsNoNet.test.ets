/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import statistics from '@ohos.net.statistics';
import bundleManager from '@ohos.bundle.bundleManager';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'StatisticsTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
    try {
        expect().assertFail();
    } catch (err) {
        console.info("expectInfo", `test failed`);
    }
}
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    } catch (err) {
        console.info("expectInfo", `test failed`);
    }
}

export default function statisticsNoNetTest() {

    describe("StatisticsNoNetTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.name   testNetworkMgrStatisticsGetAllRxBytes_static_0500
         * @tc.number SUB_NetworkMgr_Statistics_GetAllRxBytes_0500
         * @tc.desc   Obtain real-time downlink traffic of all network adapters without Ethernet access;callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrStatisticsGetAllRxBytes_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetAllRxBytes_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllRxBytes((error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectTrue(true);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrStatisticsGetAllRxBytes_static_0600
         * @tc.number SUB_NetworkMgr_Statistics_GetAllRxBytes_0600
         * @tc.desc   Obtain real-time downlink traffic of all network adapters without Ethernet access;promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrStatisticsGetAllRxBytes_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetAllRxBytes_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllRxBytes().then((stats: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectTrue(true);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrStatisticsGetAllTxBytes_static_0500
         * @tc.number SUB_NetworkMgr_Statistics_GetAllTxBytes_0500
         * @tc.desc   Obtain real-time upstream traffic of all nics without Ethernet access;callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrStatisticsGetAllTxBytes_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetAllTxBytes_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllTxBytes((error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectTrue(true);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrStatisticsGetAllTxBytes_static_0600
         * @tc.number SUB_NetworkMgr_Statistics_GetAllTxBytes_0600
         * @tc.desc   Obtain real-time upstream traffic of all nics without Ethernet access ;promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testNetworkMgrStatisticsGetAllTxBytes_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetAllTxBytes_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllTxBytes().then((stats: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectTrue(true);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

    })
}