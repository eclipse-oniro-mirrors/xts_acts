/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import connection from '@ohos.net.connection';
import http from '@ohos.net.http';

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
        console.info("expectInfo", `test sucess`);
    }
}
export default function statisticsHasNetTest() {

    describe("StatisticsHasNetTest", (): void => {

        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.name   testManagergetIfaceRxBytesAsync_static_0100
         * @tc.number SUB_Manager_getIfaceRxBytes_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceRxBytesAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceRxBytesAsync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "eth0";
                statistics.getIfaceRxBytes(ifaceName, (err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 2103005 || err?.code == 2103012);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+JSON.stringify(stats));
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetIfaceRxBytesAsync_static_0200
         * @tc.number SUB_Manager_getIfaceRxBytes_Async_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceRxBytesAsync_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceRxBytesAsync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan0";
                statistics.getIfaceRxBytes(ifaceName,(err: BusinessError<void> | null, stats: long | undefined)=>{
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectFail();
                    } else {
                       hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                       ExpectTrue(stats! >= 0);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done()
                })
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetIfaceRxBytesAsync_static_0300
         * @tc.number SUB_Manager_getIfaceRxBytes_Async_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceRxBytesAsync_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceRxBytesAsync_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan1";
                statistics.getIfaceRxBytes(ifaceName,(err: BusinessError<void> | null, stats: long | undefined)=>{
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 2103005 || err?.code == 2103012);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done()
                })
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetIfaceRxBytesPromise_static_0100
         * @tc.number SUB_Manager_getIfaceRxBytes_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceRxBytesPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceRxBytesPromise_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "eth0";
                statistics.getIfaceRxBytes(ifaceName).then((stats: long) => {
                    console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(stats)}`);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103005 || err.code == 2103012);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });

            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetIfaceRxBytesPromise_static_0200
         * @tc.number SUB_Manager_getIfaceRxBytes_Promise_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceRxBytesPromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceRxBytesPromise_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan0";
                statistics.getIfaceRxBytes(ifaceName).then((stats: long) => {
                    console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(stats)}`);
                    ExpectTrue(stats >= 0);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetIfaceRxBytesPromise_static_0300
         * @tc.number SUB_Manager_getIfaceRxBytes_Promise_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceRxBytesPromise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceRxBytesPromise_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan1";
                statistics.getIfaceRxBytes(ifaceName).then((stats: long) => {
                    console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(stats)}`);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103005 || err.code == 2103012);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetIfaceTxBytesAsync_static_0100
         * @tc.number SUB_Manager_getIfaceTxBytes_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceTxBytesAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceTxBytesAsync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "eth0";
                statistics.getIfaceTxBytes(ifaceName, (err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 2103005 || err?.code == 2103012);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+JSON.stringify(stats));
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetIfaceTxBytesAsync_static_0200
         * @tc.number SUB_Manager_getIfaceTxBytes_Async_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceTxBytesAsync_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceTxBytesAsync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan0";
                statistics.getIfaceTxBytes(ifaceName,(err: BusinessError<void> | null, stats: long | undefined)=>{
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectTrue(stats! >= 0);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done()
                })
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetIfaceTxBytesAsync_static_0300
         * @tc.number SUB_Manager_getIfaceTxBytes_Async_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceTxBytesAsync_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceTxBytesAsync_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan1";
                statistics.getIfaceTxBytes(ifaceName,(err: BusinessError<void> | null, stats: long | undefined)=>{
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 2103005 || err?.code == 2103012);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done()
                })
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetIfaceTxBytesPromise_static_0100
         * @tc.number SUB_Manager_getIfaceTxBytes_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceTxBytesPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceTxBytesPromise_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "eth0";
                statistics.getIfaceTxBytes(ifaceName).then((stats: long) => {
                    console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(stats)}`);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103005 || err.code == 2103012);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetIfaceTxBytesPromise_static_0200
         * @tc.number SUB_Manager_getIfaceTxBytes_Promise_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceTxBytesPromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceTxBytesPromise_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan0";
                statistics.getIfaceTxBytes(ifaceName).then((stats: long) => {
                    console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(stats)}`);
                    ExpectTrue(stats >= 0);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetIfaceTxBytesPromise_static_0300
         * @tc.number SUB_Manager_getIfaceTxBytes_Promise_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetIfaceTxBytesPromise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceTxBytesPromise_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan1";
                statistics.getIfaceTxBytes(ifaceName).then((stats: long) => {
                    console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(stats)}`);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103005 || err.code == 2103012);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetAllTxBytesAsync_static_0100
         * @tc.number SUB_Manager_getAllTxBytes_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetAllTxBytesAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetAllTxBytesAsync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllTxBytes((err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' getAllTxBytes success stats ->'+ stats);
                        ExpectTrue(stats! >= 0);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetAllTxBytesPromise_static_0100
         * @tc.number SUB_Manager_getAllTxBytes_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetAllTxBytesPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetAllTxBytesPromise_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllTxBytes().then((stats: long) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectTrue(stats >= 0);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetAllRxBytesAsync_static_0100
         * @tc.number SUB_Manager_getAllRxBytes_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetAllRxBytesAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetAllRxBytesAsync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllRxBytes((err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' getAllTxBytes success stats ->'+ stats);
                        ExpectTrue(stats! >= 0);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetAllRxBytesPromise_static_0100
         * @tc.number SUB_Manager_getAllRxBytes_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetAllRxBytesPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetAllRxBytesPromise_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllRxBytes().then((stats: long) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectTrue(stats >= 0);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetUidRxBytesPromise_static_0200
         * @tc.number SUB_Manager_getUidRxBytes_Promise_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetUidRxBytesPromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetUidRxBytesPromise_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let uid :int = 1010;
                const bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
                const bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlags);
                if(bundleInfo != undefined){
                    const appInfo = bundleInfo.appInfo;
                    hilog.info(domain, tag, '%{public}s', caseName + ': appInfo is' + appInfo);
                    if(appInfo && appInfo.uid !== undefined){
                        uid = appInfo.uid;
                    }
                }
                let httpRequest = http.createHttp();
                hilog.info(domain, tag, '%{public}s', caseName + 'create http');
                try {
                    let data : http.HttpResponse = await httpRequest.request('https://www.baidu.com');
                    hilog.info(domain, tag, '%{public}s', caseName + 'httpResponse result is : ' + data);                    
                }catch(err){
                    hilog.info(domain, tag, '%{public}s', caseName + 'http catch err is : ' + JSON.stringify(err.code));                             
                }
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName +': current uid is'+ uid);
                statistics.getUidRxBytes(uid).then((stats: long) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectTrue(stats >= 0);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            } catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /**
         * @tc.name   testManagergetUidRxBytesAsync_static_0200
         * @tc.number SUB_Manager_getUidRxBytes_Async_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetUidRxBytesAsync_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetUidRxBytesAsync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let uid :int = 1010;
                const bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
                const bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlags);
                if(bundleInfo != undefined){
                    const appInfo = bundleInfo.appInfo;
                    hilog.info(domain, tag, '%{public}s', caseName + ': appInfo is' + appInfo);
                    if(appInfo && appInfo.uid !== undefined){
                        uid = appInfo.uid;
                    }
                }
                statistics.getUidRxBytes(uid, (err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code !== 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' getAllTxBytes success stats ->'+ stats);
                        ExpectTrue(stats !== null);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            } catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /**
         * @tc.name   testManagergetUidTxBytesPromise_static_0200
         * @tc.number SUB_Manager_getUidTxBytes_Promise_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetUidTxBytesPromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetUidTxBytesPromise_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let uid :int = 1010;
                const bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
                const bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlags);
                if(bundleInfo != undefined){
                    const appInfo = bundleInfo.appInfo;
                    hilog.info(domain, tag, '%{public}s', caseName + ': appInfo is' + appInfo);
                    if(appInfo && appInfo.uid !== undefined){
                        uid = appInfo.uid;
                    }
                }                
                hilog.info(domain, tag, '%{public}s', caseName +': current uid is'+ uid);
                statistics.getUidTxBytes(uid).then((stats: long) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectTrue(stats >= 0);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            } catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /**
         * @tc.name   testManagergetUidTxBytesAsync_static_0200
         * @tc.number SUB_Manager_getUidTxBytes_Async_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetUidTxBytesAsync_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetUidTxBytesAsync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let uid :int = 1010;
                const bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
                const bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlags);
                if(bundleInfo != undefined){
                    const appInfo = bundleInfo.appInfo;
                    hilog.info(domain, tag, '%{public}s', caseName + ': appInfo is' + appInfo);
                    if(appInfo && appInfo.uid !== undefined){
                        uid = appInfo.uid;
                    }
                }                
                statistics.getUidTxBytes(uid, (err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code !== 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' getAllTxBytes success stats ->'+ stats);
                        ExpectTrue(stats !== null);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            } catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /**
         * @tc.name   testManagergetSockfdRxBytesPromise_static_0100
         * @tc.number SUB_Manager_getSockfdRxBytes_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetSockfdRxBytesPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetSockfdRxBytesPromise_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let sockfd :int = 1;
                statistics.getSockfdRxBytes(sockfd).then((stats: long) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2100002);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetSockfdRxBytesPromise_static_0200
         * @tc.number SUB_Manager_getSockfdRxBytes_Promise_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetSockfdRxBytesPromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetSockfdRxBytesPromise_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let sockfd :int = -1;
                statistics.getSockfdRxBytes(sockfd).then((stats: long) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2100001);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetSockfdRxBytesAsync_static_0100
         * @tc.number SUB_Manager_getSockfdRxBytes_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetSockfdRxBytesAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetSockfdRxBytesAsync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let sockfd :int = 1;
                statistics.getSockfdRxBytes(sockfd, (err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err.code == 2100002);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' getAllTxBytes success stats ->'+ stats);
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetSockfdRxBytesAsync_static_0200
         * @tc.number SUB_Manager_getSockfdRxBytes_Async_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetSockfdRxBytesAsync_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetSockfdRxBytesAsync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let sockfd :int = -1;
                statistics.getSockfdRxBytes(sockfd, (err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err.code == 2100001);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' getAllTxBytes success stats ->'+ stats);
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })        

        /**
         * @tc.name   testManagergetSockfdTxBytesPromise_static_0100
         * @tc.number SUB_Manager_getSockfdTxBytes_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetSockfdTxBytesPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetSockfdTxBytesPromise_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let sockfd :int = 1;
                statistics.getSockfdTxBytes(sockfd).then((stats: long) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2100002);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetSockfdTxBytesPromise_static_0200
         * @tc.number SUB_Manager_getSockfdTxBytes_Promise_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetSockfdTxBytesPromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetSockfdTxBytesPromise_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let sockfd :int = -1;
                statistics.getSockfdTxBytes(sockfd).then((stats: long) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2100001);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetSockfdTxBytesAsync_static_0100
         * @tc.number SUB_Manager_getSockfdTxBytes_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetSockfdTxBytesAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetSockfdTxBytesAsync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let sockfd :int = 1;
                statistics.getSockfdTxBytes(sockfd, (err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err.code == 2100002);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' getAllTxBytes success stats ->'+ stats);
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetSockfdTxBytesAsync_static_0200
         * @tc.number SUB_Manager_getSockfdTxBytes_Async_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetSockfdTxBytesAsync_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetSockfdTxBytesAsync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let sockfd :int = -1;
                statistics.getSockfdTxBytes(sockfd, (err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err.code == 2100001);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' getAllTxBytes success stats ->'+ stats);
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetCellularRxBytesPromise_static_0100
         * @tc.number SUB_Manager_getCellularRxBytes_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetCellularRxBytesPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetCellularRxBytesPromise_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getCellularRxBytes().then((stats: long) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103012);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetCellularRxBytesAsync_static_0100
         * @tc.number SUB_Manager_getCellularRxBytes_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetCellularRxBytesAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetCellularRxBytesAsync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getCellularRxBytes((err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err.code == 2103012);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' getAllTxBytes success stats ->'+ stats);
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetCellularTxBytesPromise_static_0100
         * @tc.number SUB_Manager_getCellularTxBytes_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetCellularTxBytesPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetCellularTxBytesPromise_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getCellularTxBytes().then((stats: long) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103012);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagergetCellularTxBytesAsync_static_0100
         * @tc.number SUB_Manager_getCellularTxBytes_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagergetCellularTxBytesAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetCellularTxBytesAsync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getCellularTxBytes((err: BusinessError<void> | null, stats: long | undefined) => {
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err.code == 2103012);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' getAllTxBytes success stats ->'+ stats);
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagerNetStatsInfo_static_0100
         * @tc.number SUB_Manager_NetStatsInfo_Property_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagerNetStatsInfo_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagerNetStatsInfo_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let netStatsInfo : statistics.NetStatsInfo ={
                    rxBytes : 1000,
                    txBytes : 1000,
                    rxPackets : 10,
                    txPackets : 10,
                }
                ExpectTrue(typeof(netStatsInfo.rxBytes) === "long");
                ExpectTrue(typeof(netStatsInfo.txBytes) === "long");
                ExpectTrue(typeof(netStatsInfo.rxPackets) === "long");
                ExpectTrue(typeof(netStatsInfo.txPackets) === "long");
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testManagerNetWorkInfo_static_0100
         * @tc.number SUB_Manager_NetWorkInfo_Property_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testManagerNetWorkInfo_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagerNetWorkInfo_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let netWorkInfo : statistics.NetworkInfo ={
                    type : connection.NetBearType.BEARER_WIFI,
                    startTime : 1000,
                    endTime : 2000,
                    simId : 0,
                }
                ExpectTrue(typeof(netWorkInfo.type) === "int");
                ExpectTrue(typeof(netWorkInfo.startTime) === "int");
                ExpectTrue(typeof(netWorkInfo.endTime) === "int");
                ExpectTrue(typeof(netWorkInfo.simId) === "int");
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

    })

}