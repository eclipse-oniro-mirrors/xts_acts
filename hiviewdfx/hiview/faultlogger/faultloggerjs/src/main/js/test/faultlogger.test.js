/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import faultlogger from '@ohos.faultLogger'
import hiSysEvent from '@ohos.hiSysEvent'
import faultloggerTestNapi from "libfaultlogger_test_napi_xts.so"
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function FaultlogJsTest() {

describe("FaultlogJsTest", function () {
    beforeAll(function() {
        console.info('FaultlogJsTest beforeAll called')
    })

    afterAll(function() {
        console.info('FaultlogJsTest afterAll called')
    })

    beforeEach(function() {
        console.info('FaultlogJsTest beforeEach called')
    })

    afterEach(function() {
        console.info('FaultlogJsTest afterEach called')
    })

    async function msleep(time) {
        let timeoutID = null;
        let promise = new Promise((resolve, reject) => {
            timeoutID = setTimeout(() => resolve("done!"), time)
        });
        let result = await promise;
        clearTimeout(timeoutID);
    }

    function BeginSubscriptionOnEvent(domainName, eventName, onEventCallback) {
        let watchRules = [{
            domain: domainName,
            name: eventName,
            ruleType: hiSysEvent.RuleType.WHOLE_WORD,
        }]
        let watcher = {
            rules: watchRules,
            onEvent: (info) => {
                onEventCallback(info)
            },
            onServiceDied: () => {
                // do something here.
            }
        }
        try {
            hiSysEvent.addWatcher(watcher)
        } catch (err) {
            console.error(`>>> error code: ${err.code}, error msg: ${err.message}`);
            expect(false).assertTrue();
        }
        return watcher
    }

    function EndSubscriptionOnEvent(watcher) {
        try {
            hiSysEvent.removeWatcher(watcher)
        } catch (err) {
            console.error(`>>> error code: ${err.code}, error msg: ${err.message}`);
            expect(false).assertTrue();
        }
    }

    /**
     * @tc.number test_0200
     * @tc.name DFX_DFR_Faultlogger_Interface_0200
     * @tc.desc 检验函数参数输入错误时程序是否会崩溃
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('DFX_DFR_Faultlogger_Interface_0200', 0, async function (done) {
        console.info("---------------------------DFX_DFR_Faultlogger_Interface_0200----------------------------------");
        try {
            let ret1 = faultlogger.querySelfFaultLog("faultloggertestsummary01");
            console.info("DFX_DFR_Faultlogger_Interface_0200 ret1 == " + ret1);
            expect(ret1).assertEqual(undefined);

            let ret2 = faultlogger.querySelfFaultLog(faultlogger.FaultType.JS_CRASH, "faultloggertestsummary01");
            console.info("DFX_DFR_Faultlogger_Interface_0200 ret2 == " + ret2);
            expect(ret2).assertEqual(undefined);

            let ret3 = faultlogger.querySelfFaultLog();
            console.info("DFX_DFR_Faultlogger_Interface_0200 ret3 == " + ret3);
            expect(ret3).assertEqual(undefined);
            done();
            return;
        } catch(err) {
            console.info(err);
        }
        expect(false).assertTrue();
        done();
    })

    /**
     * @tc.number test_0400
     * @tc.name DFX_DFR_Faultlogger_Interface_0400
     * @tc.desc 检验promise同步方式获取faultlog CPP_CRASH日志
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('DFX_DFR_Faultlogger_Interface_0400', 0, async function (done) {
        console.info("---------------------------DFX_DFR_Faultlogger_Interface_0400----------------------------------");
        try {
            let now = Date.now();
            console.info("DFX_DFR_Faultlogger_Interface_0400 2 + " + now);
            let subscribedEventCnt = 0;
            let watcher = BeginSubscriptionOnEvent("RELIABILITY", "CPP_CRASH", (info) => {
                subscribedEventCnt++
            })
            console.info("start triggerCppCrash");
            const res = faultloggerTestNapi.triggerCppCrash();
            console.info("DFX_DFR_Faultlogger_Interface_0400 res:" + res);
            while (subscribedEventCnt < 1) {
                await msleep(100);
            }
            EndSubscriptionOnEvent(watcher)
            console.info("--------DFX_DFR_Faultlogger_Interface_0400 4" + "----------");
            let ret = await faultlogger.querySelfFaultLog(faultlogger.FaultType.CPP_CRASH);
            console.info("DFX_DFR_Faultlogger_Interface_0400 query ret length:" + ret.length);
            expect(ret.length).assertLarger(0);
            console.info("DFX_DFR_Faultlogger_Interface_0400 check reason, index:" + (ret[0].reason.indexOf("Signal:SIGABRT")));
            expect(ret[0].reason.indexOf("Signal:SIGABRT") != -1).assertTrue();
            console.info("DFX_DFR_Faultlogger_Interface_0400 fullLog length:" + ret[0].fullLog.length);
            console.info("DFX_DFR_Faultlogger_Interface_0400 check fullLog, index:" + ret[0].fullLog.indexOf("Fault thread info"));
            expect(ret[0].fullLog.indexOf("Fault thread info") != -1).assertTrue();
            expect(typeof(ret[0].pid) == "number").assertTrue();
            expect(typeof(ret[0].uid) == "number").assertTrue();
            expect(typeof(ret[0].type) == "number").assertTrue();
            expect(typeof(ret[0].timestamp) == "number").assertTrue();
            expect(typeof(ret[0].reason) == "string").assertTrue();
            expect(typeof(ret[0].module) == "string").assertTrue();
            expect(typeof(ret[0].summary) == "string").assertTrue();
            expect(typeof(ret[0].fullLog) == "string").assertTrue();
            console.info("--------DFX_DFR_Faultlogger_Interface_0400 5" + "----------");
            done();
            return;
        } catch (err) {
            console.info("catch (err) == " + err);
        }
        console.info("DFX_DFR_Faultlogger_Interface_0400 error");
        expect(false).assertTrue();
        done();
    })

     /**
     * @tc.number test_0500
     * @tc.name DFX_DFR_Faultlogger_Interface_0500
     * @tc.desc 检验promise同步方式获取faultlog JS_CRASH日志
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
     it('DFX_DFR_Faultlogger_Interface_0500', 0, async function (done) {
        console.info("---------------------------DFX_DFR_Faultlogger_Interface_0500----------------------------------");
        try {
            const loopTimes = 10;
            let subscribedEventCnt = 0;
            let watcher = BeginSubscriptionOnEvent("ACE", "JS_ERROR", (info) => {
                subscribedEventCnt++
            })
            let now = Date.now();
            console.info("DFX_DFR_Faultlogger_Interface_0500 2 + " + now);
            hiSysEvent.write({
                domain: "ACE",
                name: "JS_ERROR",
                eventType: hiSysEvent.EventType.FAULT,
                params: {
                    PID: 487,
                    UID:103,
                    PACKAGE_NAME: "com.ohos.faultlogger.test",
                    PROCESS_NAME: "com.ohos.faultlogger.test",
                    MSG: "faultlogger testcase test.",
                    REASON: "faultlogger testcase test."
                }
            }).then(
                (value) => {
                    console.log(`HiSysEvent json-callback-success value=${value}`);
                })
            while (subscribedEventCnt < 1) {
                await msleep(100);
            }
            EndSubscriptionOnEvent(watcher)
            console.info("--------DFX_DFR_Faultlogger_Interface_0500 4" + "----------");
            let ret = await faultlogger.querySelfFaultLog(faultlogger.FaultType.JS_CRASH);
            console.info("DFX_DFR_Faultlogger_Interface_0500 ret == " + ret.length);
            if (ret.length > 0) {
                expect(true).assertTrue();
            } else {
                expect(false).assertTrue();
            }
            for (let i = 0; i < ret.length; i++) {
                console.info("faultloggertestsummary03 " + i + " fullLog.length " + ret[i].fullLog.length);
            }
            done();
            return;
        } catch (err) {
            console.info("catch (err) == " + err);
        }
        console.info("DFX_DFR_Faultlogger_Interface_0500 error");
        expect(false).assertTrue();
        done();
    })

     /**
     * @tc.number test_0300
     * @tc.name DFX_DFR_Faultlogger_Interface_0300
     * @tc.desc 检验promise同步方式获取faultlog APP_FREEZE日志
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
     it('DFX_DFR_Faultlogger_Interface_0300', 0, async function (done) {
        console.info("---------------------------DFX_DFR_Faultlogger_Interface_0300----------------------------------");
        try {
            let now = Date.now();
            console.info("DFX_DFR_Faultlogger_Interface_0300 2 + " + now);
            let module = "ohos.faultloggerjs.test";
            const loopTimes = 10;
            let subscribedEventCnt = 0;
            let watcher = BeginSubscriptionOnEvent("RELIABILITY", "APP_FREEZE", (info) => {
                subscribedEventCnt++
            })
            for (let i = 0; i < loopTimes; i++) {
                console.info("--------DFX_DFR_Faultlogger_Interface_0300 3 + " + i + "----------");
                faultlogger.addFaultLog(i - 400,
                    faultlogger.FaultType.APP_FREEZE, module, "faultloggertestsummary04 " + i);
                await msleep(300);
            }
            while (subscribedEventCnt < loopTimes) {
                await msleep(100);
            }
            EndSubscriptionOnEvent(watcher)

            console.info("--------DFX_DFR_Faultlogger_Interface_0300 4" + "----------");
            let ret = await faultlogger.querySelfFaultLog(faultlogger.FaultType.APP_FREEZE);
            console.info("DFX_DFR_Faultlogger_Interface_0300 ret == " + ret.length);
            expect(ret.length).assertEqual(loopTimes);
            for (let i = 0; i < loopTimes; i++) {
                console.info("faultloggertestsummary04 " + i + " fullLog.length " + ret[i].fullLog.length);
                if (ret[i].fullLog.indexOf("faultloggertestsummary04 " + (loopTimes - 1 - i)) != -1) {
                    console.info("DFX_DFR_Faultlogger_Interface_0300 " + ret[i].fullLog.length);
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            }
            done();
            return;
        } catch (err) {
            console.info("catch (err) == " + err);
        }
        console.info("DFX_DFR_Faultlogger_Interface_0300 error");
        expect(false).assertTrue();
        done();
    })

     /**
     * @tc.number test_0100
     * @tc.name DFX_DFR_Faultlogger_Interface_0100
     * @tc.desc 检验通过回调方式获取faultlog日志
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('DFX_DFR_Faultlogger_Interface_0100', 0, async function (done) {
        console.info("---------------------------DFX_DFR_Faultlogger_Interface_0100----------------------------------");
        try {
            let now = Date.now();
            console.info("DFX_DFR_Faultlogger_Interface_0100 start + " + now);
            let subscribedEventCnt = 0;
            let watcher = BeginSubscriptionOnEvent("RELIABILITY", "CPP_CRASH", (info) => {
                subscribedEventCnt++
            })
            console.info("start triggerCppCrash");
            const res = faultloggerTestNapi.triggerCppCrash();
            console.info("DFX_DFR_Faultlogger_Interface_0100 res:" + res);
            while (subscribedEventCnt < 1) {
                await msleep(100);
            }
            EndSubscriptionOnEvent(watcher)
            console.info("--------DFX_DFR_Faultlogger_Interface_0100 4----------");
            function queryFaultLogCallback(error, ret) {
                if (error) {
                    console.info('DFX_DFR_Faultlogger_Interface_0100  once error is ' + error);
                } else {
                    console.info("DFX_DFR_Faultlogger_Interface_0100 query ret length:" + ret.length);
                    expect(ret.length).assertLarger(0);
                    console.info("DFX_DFR_Faultlogger_Interface_0100 check reason, index:" + (ret[0].reason.indexOf("Signal:SIGABRT")));
                    expect(ret[0].reason.indexOf("Signal:SIGABRT") != -1).assertTrue();
                    console.info("DFX_DFR_Faultlogger_Interface_0100 check fullLog, index:" + ret[0].fullLog.indexOf("Fault thread info"));
                    expect(ret[0].fullLog.indexOf("Fault thread info") != -1).assertTrue();
                }
                done();
            }
            faultlogger.querySelfFaultLog(faultlogger.FaultType.CPP_CRASH, queryFaultLogCallback);
            return;
        } catch (err) {
            console.info(err);
        }
        console.info("DFX_DFR_Faultlogger_Interface_0100 error");
        expect(false).assertTrue();
        done();
    })

     /**
     * @tc.number test_0600
     * @tc.name DFX_DFR_Faultlogger_Interface_0600
     * @tc.desc 检验query函数正常入参
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('DFX_DFR_Faultlogger_Interface_0600', 0, function () {
        console.info("---------------------------DFX_DFR_Faultlogger_Interface_0600----------------------------------");
        try {
            let ret = faultlogger.query("faultloggertestsummary06");
            console.info("DFX_DFR_Faultlogger_Interface_0600 ret == " + ret);
            expect(ret).assertTrue();
            return;
        } catch(err) {
            console.info(err.code);
            console.info(err.message);
            expect(err.code == 401).assertTrue();
        }
    })

     /**
     * @tc.number test_0700
     * @tc.name DFX_DFR_Faultlogger_Interface_0700
     * @tc.desc 检验query函数入参数量为2时程序是否会崩溃
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('DFX_DFR_Faultlogger_Interface_0700', 0, function () {
        console.info("---------------------------DFX_DFR_Faultlogger_Interface_0700----------------------------------");
        try {
            let ret = faultlogger.query(faultlogger.FaultType.JS_CRASH, "faultloggertestsummary07");
            console.info("DFX_DFR_Faultlogger_Interface_0700 ret == " + ret);
            return;
        } catch(err) {
            console.info(err.code);
            console.info(err.message);
            expect(err.code == 401).assertTrue();
        }
    })

     /**
     * @tc.number test_0800
     * @tc.name DFX_DFR_Faultlogger_Interface_0800
     * @tc.desc 检验query函数入参为空时程序是否会崩溃
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('DFX_DFR_Faultlogger_Interface_0800', 0, function () {
        console.info("---------------------------DFX_DFR_Faultlogger_Interface_0800----------------------------------");
        try {
            let ret = faultlogger.query();
            console.info("DFX_DFR_Faultlogger_Interface_0800 ret == " + ret);
            return;
        } catch(err) {
            console.info(err.code);
            console.info(err.message);
            expect(err.code == 401).assertTrue();
        }
    })

     /**
     * @tc.number test_0900
     * @tc.name DFX_DFR_Faultlogger_Interface_0900
     * @tc.desc 检验promise同步方式获取faultlog JS_CRASH日志
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
     it('DFX_DFR_Faultlogger_Interface_0900', 0, async function (done) {
        console.info("---------------------------DFX_DFR_Faultlogger_Interface_0900----------------------------------");
        try {
            let subscribedEventCnt = 0;
            let watcher = BeginSubscriptionOnEvent("ACE", "JS_ERROR", (info) => {
                subscribedEventCnt++
            })
            let now = Date.now();
            console.info("DFX_DFR_Faultlogger_Interface_0900 2 + " + now);
            hiSysEvent.write({
                domain: "ACE",
                name: "JS_ERROR",
                eventType: hiSysEvent.EventType.FAULT,
                params: {
                    PID: 487,
                    UID:103,
                    PACKAGE_NAME: "com.ohos.faultlogger.test",
                    PROCESS_NAME: "com.ohos.faultlogger.test",
                    MSG: "faultlogger testcase test.",
                    REASON: "faultlogger testcase test."
                }
            }).then(
                (value) => {
                    console.log(`HiSysEvent json-callback-success value=${value}`);
                })
            while (subscribedEventCnt < 1) {
                await msleep(100);
            }
            EndSubscriptionOnEvent(watcher)
            console.info("--------DFX_DFR_Faultlogger_Interface_0900 4" + "----------");
            let ret = await faultlogger.query(faultlogger.FaultType.JS_CRASH);
            console.info("DFX_DFR_Faultlogger_Interface_0900 ret == " + ret.length);
            if (ret.length > 0) {
                expect(true).assertTrue();
            } else {
                expect(false).assertTrue();
            }
            for (let i = 0; i < ret.length; i++) {
                console.info("faultloggertestsummary08 " + i + " fullLog.length " + ret[i].fullLog.length);
            }
            done();
            return;
        } catch (err) {
            console.info("catch (err) == " + err);
        }
        console.info("DFX_DFR_Faultlogger_Interface_0900 error");
        expect(false).assertTrue();
        done();
    })

     /**
     * @tc.number test_1000
     * @tc.name DFX_DFR_Faultlogger_Interface_1000
     * @tc.desc 检验promise同步方式获取faultlog APP_FREEZE日志
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
     it('DFX_DFR_Faultlogger_Interface_1000', 0, async function (done) {
        console.info("---------------------------DFX_DFR_Faultlogger_Interface_1000----------------------------------");
        try {
            let now = Date.now();
            console.info("DFX_DFR_Faultlogger_Interface_1000 2 + " + now);
            let module = "ohos.faultloggerjs.test";
            const loopTimes = 10;
            let subscribedEventCnt = 0;
            let watcher = BeginSubscriptionOnEvent("RELIABILITY", "APP_FREEZE", (info) => {
                subscribedEventCnt++
            })
            for (let i = 0; i < loopTimes; i++) {
                console.info("--------DFX_DFR_Faultlogger_Interface_1000 3 + " + i + "----------");
                faultlogger.addFaultLog(i - 200,
                    faultlogger.FaultType.APP_FREEZE, module, "faultloggertestsummary09 " + i);
                await msleep(300);
            }
            while (subscribedEventCnt < loopTimes) {
                await msleep(100);
            }
            EndSubscriptionOnEvent(watcher)
            console.info("--------DFX_DFR_Faultlogger_Interface_1000 4" + "----------");
            let ret = await faultlogger.query(faultlogger.FaultType.APP_FREEZE);
            console.info("DFX_DFR_Faultlogger_Interface_1000 ret == " + ret.length);
            expect(ret.length).assertEqual(loopTimes);
            for (let i = 0; i < loopTimes; i++) {
                console.info("faultloggertestsummary09 " + i + " fullLog.length " + ret[i].fullLog.length);
                if (ret[i].fullLog.indexOf("faultloggertestsummary09 " + (loopTimes - 1 - i)) != -1) {
                    console.info("DFX_DFR_Faultlogger_Interface_1000 " + ret[i].fullLog.length);
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            }
            console.info("--------DFX_DFR_Faultlogger_Interface_1000 5" + "----------");
            ret = await faultlogger.querySelfFaultLog(faultlogger.FaultType.NO_SPECIFIC);
            console.info("DFX_DFR_Faultlogger_Interface_1000 ret == " + ret.length);
            expect(ret.length).assertEqual(loopTimes);
            done();
            return;
        } catch (err) {
            console.info("catch (err) == " + err);
        }
        console.info("DFX_DFR_Faultlogger_Interface_1000 error");
        expect(false).assertTrue();
        done();
    })

     /**
     * @tc.number test_1100
     * @tc.name DFX_DFR_Faultlogger_Interface_1100
     * @tc.desc 检验通过回调方式获取faultlog日志
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('DFX_DFR_Faultlogger_Interface_1100', 0, async function (done) {
        console.info("---------------------------DFX_DFR_Faultlogger_Interface_1100----------------------------------");
        try {
            let now = Date.now();
            console.info("DFX_DFR_Faultlogger_Interface_1100 start + " + now);
            let subscribedEventCnt = 0;
            let watcher = BeginSubscriptionOnEvent("RELIABILITY", "CPP_CRASH", (info) => {
                subscribedEventCnt++
            })
            console.info("start triggerCppCrash");
            const res = faultloggerTestNapi.triggerCppCrash();
            console.info("DFX_DFR_Faultlogger_Interface_1100 res:" + res);
            while (subscribedEventCnt < 1 ) {
                await msleep(100);
            }
            EndSubscriptionOnEvent(watcher)
            console.info("--------DFX_DFR_Faultlogger_Interface_1100 4----------");
            function queryFaultLogCallback(error, ret) {
                if (error) {
                    console.info('DFX_DFR_Faultlogger_Interface_1100  once error is ' + error);
                } else {
                    console.info("DFX_DFR_Faultlogger_Interface_1100 query ret length:" + ret.length);
                    expect(ret.length).assertLarger(0);
                    console.info("DFX_DFR_Faultlogger_Interface_1100 check reason, index:" + (ret[0].reason.indexOf("Signal:SIGABRT")));
                    expect(ret[0].reason.indexOf("Signal:SIGABRT") != -1).assertTrue();
                    console.info("DFX_DFR_Faultlogger_Interface_1100 check fullLog, index:" + ret[0].fullLog.indexOf("Fault thread info"));
                    expect(ret[0].fullLog.indexOf("Fault thread info") != -1).assertTrue();
                }
                done();
            }
            faultlogger.query(faultlogger.FaultType.CPP_CRASH, queryFaultLogCallback);
            return;
        } catch (err) {
            console.info(err);
        }
        console.info("DFX_DFR_Faultlogger_Interface_1100 error");
        expect(false).assertTrue();
        done();
    })
})
}
