/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import hiTraceMeter from "@ohos.hiTraceMeter"
import hilog from '@ohos.hilog'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
export default function HitraceMeterTest() {
describe("HitraceMeterTest", function () {

    /**
     * @tc.name   DFX_DFR_HitraceMeter_0100
     * @tc.number DFX_DFR_HitraceMeter_0100
     * @tc.desc   DFX_DFR_HitraceMeter_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_HitraceMeter_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("-------DFX_DFR_HitraceMeter_0100 start--------");
        for (var i = 0; i < 3; i++) {
            console.info("DFX_DFR_HitraceMeter_0100 i = " + i)
            console.info("DFX_DFR_HitraceMeter_0100 " + i.toString() + " finishTrace start");
            hiTraceMeter.finishTrace("test-" + i.toString(), 111 + i);
            console.info("DFX_DFR_HitraceMeter_0100 " + i.toString() + "finishTrace end");
        }

        console.info("DFX_DFR_HitraceMeter_0100 end");
        done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_0200
     * @tc.number DFX_DFR_HitraceMeter_0200
     * @tc.desc   DFX_DFR_HitraceMeter_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_HitraceMeter_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("------DFX_DFR_HitraceMeter_0200 start------");
        // Normal condition
        let flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0200 1 start");
            hiTraceMeter.startTrace("test2", 222);
            expect(true).assertTrue();
            console.info("DFX_DFR_HitraceMeter_0200 1 success");
        } catch (err) {
            console.info("DFX_DFR_HitraceMeter_0200 1 fail!");
            console.info("DFX_DFR_HitraceMeter_0200 1 err = " + err);
            expect(false).assertTrue();
        }
        // Abnormal condition, Pass only one parameter
        try {
            console.info("DFX_DFR_HitraceMeter_0200 2 start");
            hiTraceMeter.startTrace("test2");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0200 2 fail!");
            console.info("DFX_DFR_HitraceMeter_0200 2 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Pass multiple parameters
        flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0200 3 start");
            hiTraceMeter.startTrace("test2", 222, 2000, 2);
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0200 3 fail!");
            console.info("DFX_DFR_HitraceMeter_0200 3 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Parameter format mismatch
        flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0200 4 start");
            hiTraceMeter.startTrace(2, "222", "2000");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0200 4 fail!");
            console.info("DFX_DFR_HitraceMeter_0200 4 err = " + err);
            expect(flag).assertTrue();
        }
        console.info("------DFX_DFR_HitraceMeter_0200 end------");
        done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_0300
     * @tc.number DFX_DFR_HitraceMeter_0300
     * @tc.desc   DFX_DFR_HitraceMeter_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_HitraceMeter_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("------DFX_DFR_HitraceMeter_0300 start------");
        // Normal condition
        let flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0300 1 start")
            hiTraceMeter.finishTrace("test3", 111);
            expect(true).assertTrue();
            console.info("DFX_DFR_HitraceMeter_0300 1 success");
        } catch (err) {
            console.info("DFX_DFR_HitraceMeter_0300 1 fail!");
            console.info("DFX_DFR_HitraceMeter_0300 1 err = " + err);
            expect(false).assertTrue();
        }
        // Abnormal condition, Pass only one parameter
        try {
            console.info("DFX_DFR_HitraceMeter_0300 2 start")
            hiTraceMeter.finishTrace("test3");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0300 2 fail!");
            console.info("DFX_DFR_HitraceMeter_0300 2 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Pass multiple parameters
        flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0300 3 start")
            hiTraceMeter.finishTrace("test3", 1, 1);
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0300 3 fail!");
            console.info("DFX_DFR_HitraceMeter_0300 3 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Parameter format mismatch
        flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0300 4 start")
            hiTraceMeter.finishTrace(1, "123");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0300 4 fail!");
            console.info("DFX_DFR_HitraceMeter_0300 4 err = " + err);
            expect(flag).assertTrue();
        }
        console.info("------DFX_DFR_HitraceMeter_0300 end------");
        done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_0400
     * @tc.number DFX_DFR_HitraceMeter_0400
     * @tc.desc   DFX_DFR_HitraceMeter_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_HitraceMeter_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("-------DFX_DFR_HitraceMeter_0400 start--------");
        for (var i = 0; i < 3; i++) {
            console.info("DFX_DFR_HitraceMeter_0400 :" + i);
            hiTraceMeter.traceByValue("test4-" + i.toString(), 3 + i);
        }
        console.info("DFX_DFR_HitraceMeter_0400 end");
        done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_0500
     * @tc.number DFX_DFR_HitraceMeter_0500
     * @tc.desc   DFX_DFR_HitraceMeter_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_HitraceMeter_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("-------DFX_DFR_HitraceMeter_0500 start--------");
        // Normal condition
        let flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0500 1 start")
            hiTraceMeter.traceByValue("test5", 5);
            expect(true).assertTrue();
            console.info("DFX_DFR_HitraceMeter_0500 1 success")
        } catch (err) {
            console.info("DFX_DFR_HitraceMeter_0500 1 fail!");
            console.info("DFX_DFR_HitraceMeter_0500 1 err = " + err);
            expect(false).assertTrue();
        }
        // Abnormal condition, Pass only one parameter
        try {
            console.info("DFX_DFR_HitraceMeter_0500 2 start")
            hiTraceMeter.traceByValue("test5");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0500 2 fail!");
            console.info("DFX_DFR_HitraceMeter_0500 2 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Pass multiple parameters
        flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0500 3 start")
            hiTraceMeter.traceByValue("test5", 3, 1);
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0500 3 fail!");
            console.info("DFX_DFR_HitraceMeter_0500 3 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Parameter format mismatch
        flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0500 4 start")
            hiTraceMeter.traceByValue(1, "123");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0500 4 fail!");
            console.info("DFX_DFR_HitraceMeter_0500 4 err = " + err);
            expect(flag).assertTrue();
        }
        console.info("------DFX_DFR_HitraceMeter_0500 end------");
        done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_0600
     * @tc.number DFX_DFR_HitraceMeter_0600
     * @tc.desc   DFX_DFR_HitraceMeter_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_HitraceMeter_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("-------DFX_DFR_HitraceMeter_0600 start--------");
        let flag = false;
        let traceCount = 1;
        try {
            console.info("DFX_DFR_HitraceMeter_0600 1 start")
            hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.DEBUG, 'myTestAsyncTrace', 1001, 'categoryTest', 'key=value');
            hiTraceMeter.traceByValue(hiTraceMeter.HiTraceOutputLevel.DEBUG, 'myTestCountTrace', traceCount);
            hilog.info(0x0000, 'testTrace', 'myTraceTest running, taskId: 1001');
            hiTraceMeter.finishAsyncTrace(hiTraceMeter.HiTraceOutputLevel.DEBUG, 'myTestAsyncTrace', 1001);
            expect(true).assertTrue();
            console.info("DFX_DFR_HitraceMeter_0600 1 success");
        } catch (err) {
            console.info("DFX_DFR_HitraceMeter_0600 1 fail!");
            console.info("DFX_DFR_HitraceMeter_0600 1 err = " + err);
            expect(false).assertTrue();
        }
        // Abnormal condition, Pass only one parameter
        try {
            console.info("DFX_DFR_HitraceMeter_0600 2 start")
            hiTraceMeter.startSyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO, 'myTestSyncTrace', 'key=value');
            hilog.info(0x0000, 'testTrace', 'myTraceTest running, synchronizing trace');
            hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO);
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0600 2 fail!");
            console.info("DFX_DFR_HitraceMeter_0600 2 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Pass multiple parameters
        flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0600 3 start")
            let istrace = hiTraceMeter.isTraceEnabled()
            if (istrace) {
                expect(istrace).assertTrue();
                let customArgs = 'key0=value0';
                for(let index = 1; index < 10; index++) {
                  customArgs += `,key${index}=value${index}`
                }
                hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.CRITICAL, 'myTestAsyncTrace', 1003, 'categoryTest', customArgs);
                hilog.info(0x0000, 'testTrace', 'myTraceTest running, taskId: 1003');
                hiTraceMeter.finishAsyncTrace(hiTraceMeter.HiTraceOutputLevel.CRITICAL, 'myTestAsyncTrace', 1003);
              } else {
                hilog.info(0x0000, 'testTrace', 'myTraceTest running, trace is not enabled');
              }
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0600 3 fail!");
            console.info("DFX_DFR_HitraceMeter_0600 3 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Parameter format mismatch
        flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0600 4 start")
            hiTraceMeter.startSyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL, 'myTestSyncTrace', 'key=value');
            hilog.info(0x0000, 'testTrace', 'myTraceTest running, synchronizing trace');
            hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.MAX);
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0600 4 fail!");
            console.info("DFX_DFR_HitraceMeter_0600 4 err = " + err);
            expect(flag).assertTrue();
        }
        console.info("------DFX_DFR_HitraceMeter_0600 end------");

        flag = false;
        try {
            console.info("DFX_DFR_HitraceMeter_0600 5 start")
            hiTraceMeter.startSyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL, 'myTestSyncTrace');
            hilog.info(0x0000, 'testTrace', 'myTraceTest running, synchronizing trace');
            hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.MAX);
            hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.CRITICAL, 'myTestAsyncTrace', 1003, 'categoryTest');
            hilog.info(0x0000, 'testTrace', 'myTraceTest running, taskId: 1003');
            hiTraceMeter.finishAsyncTrace(hiTraceMeter.HiTraceOutputLevel.CRITICAL, 'myTestAsyncTrace', 1003);    
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_HitraceMeter_0600 5 fail!");
            console.info("DFX_DFR_HitraceMeter_0600 5 err = " + err);
            expect(flag).assertTrue();
        }
        console.info("------DFX_DFR_HitraceMeter_0600 end------");
        done();
    })

})
}