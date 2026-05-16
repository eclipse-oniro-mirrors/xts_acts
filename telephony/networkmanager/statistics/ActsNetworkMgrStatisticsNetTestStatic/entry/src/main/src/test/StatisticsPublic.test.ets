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




    })
}