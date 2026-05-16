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
import bytrace from "@ohos.bytrace"
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
export default function BytraceTest() {
describe("BytraceTest", function () {

    /**
     * @tc.name   DFX_DFR_Bytrace_0100
     * @tc.number DFX_DFR_Bytrace_0100
     * @tc.desc   DFX_DFR_Bytrace_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_Bytrace_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("-------DFX_DFR_Bytrace_0100 start--------");
        for (var i = 0; i < 3; i++) {
            console.info("DFX_DFR_Bytrace_0100 i = " + i)
            console.info("DFX_DFR_Bytrace_0100 " + i.toString() + " startTrace start");
            bytrace.startTrace("test-" + i.toString(), 111 + i, 5000);
            console.info("DFX_DFR_Bytrace_0100 " + i.toString() + "startTrace end");
            console.info("DFX_DFR_Bytrace_0100 " + i.toString() + " finishTrace start");
            bytrace.finishTrace("test-" + i.toString(), 111 + i);
            console.info("DFX_DFR_Bytrace_0100 " + i.toString() + "finishTrace end");
        }

        console.info("DFX_DFR_Bytrace_0100 end");
        done();
    })

    /**
     * @tc.name   DFX_DFR_Bytrace_0200
     * @tc.number DFX_DFR_Bytrace_0200
     * @tc.desc   DFX_DFR_Bytrace_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_Bytrace_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("------DFX_DFR_Bytrace_0200 start------");
        // Normal condition
        let flag = false;
        try {
            console.info("DFX_DFR_Bytrace_0200 1 start");
            bytrace.startTrace("test2", 222);
            expect(true).assertTrue();
            console.info("DFX_DFR_Bytrace_0200 1 success");
        } catch (err) {
            console.info("DFX_DFR_Bytrace_0200 1 fail!");
            console.info("DFX_DFR_Bytrace_0200 1 err = " + err);
            expect(false).assertTrue();
        }
        // Abnormal condition, Pass only one parameter
        try {
            console.info("DFX_DFR_Bytrace_0200 2 start");
            bytrace.startTrace("test2");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_Bytrace_0200 2 fail!");
            console.info("DFX_DFR_Bytrace_0200 2 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Pass multiple parameters
        flag = false;
        try {
            console.info("DFX_DFR_Bytrace_0200 3 start");
            bytrace.startTrace("test2", 222, 2000, 2);
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_Bytrace_0200 3 fail!");
            console.info("DFX_DFR_Bytrace_0200 3 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Parameter format mismatch
        flag = false;
        try {
            console.info("DFX_DFR_Bytrace_0200 4 start");
            bytrace.startTrace(2, "222", "2000");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_Bytrace_0200 4 fail!");
            console.info("DFX_DFR_Bytrace_0200 4 err = " + err);
            expect(flag).assertTrue();
        }
        console.info("------DFX_DFR_Bytrace_0200 end------");
        done();
    })

    /**
     * @tc.name   DFX_DFR_Bytrace_0300
     * @tc.number DFX_DFR_Bytrace_0300
     * @tc.desc   DFX_DFR_Bytrace_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_Bytrace_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("------DFX_DFR_Bytrace_0300 start------");
        // Normal condition
        let flag = false;
        try {
            console.info("DFX_DFR_Bytrace_0300 1 start")
            bytrace.finishTrace("test3", 111);
            expect(true).assertTrue();
            console.info("DFX_DFR_Bytrace_0300 1 success");
        } catch (err) {
            console.info("DFX_DFR_Bytrace_0300 1 fail!");
            console.info("DFX_DFR_Bytrace_0300 1 err = " + err);
            expect(false).assertTrue();
        }
        // Abnormal condition, Pass only one parameter
        try {
            console.info("DFX_DFR_Bytrace_0300 2 start")
            bytrace.finishTrace("test3");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_Bytrace_0300 2 fail!");
            console.info("DFX_DFR_Bytrace_0300 2 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Pass multiple parameters
        flag = false;
        try {
            console.info("DFX_DFR_Bytrace_0300 3 start")
            bytrace.finishTrace("test3", 1, 1);
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_Bytrace_0300 3 fail!");
            console.info("DFX_DFR_Bytrace_0300 3 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Parameter format mismatch
        flag = false;
        try {
            console.info("DFX_DFR_Bytrace_0300 4 start")
            bytrace.finishTrace(1, "123");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_Bytrace_0300 4 fail!");
            console.info("DFX_DFR_Bytrace_0300 4 err = " + err);
            expect(flag).assertTrue();
        }
        console.info("------DFX_DFR_Bytrace_0300 end------");
        done();
    })

    /**
     * @tc.name   DFX_DFR_Bytrace_0400
     * @tc.number DFX_DFR_Bytrace_0400
     * @tc.desc   DFX_DFR_Bytrace_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_Bytrace_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("-------DFX_DFR_Bytrace_0400 start--------");
        for (var i = 0; i < 3; i++) {
            console.info("DFX_DFR_Bytrace_0400 :" + i);
            bytrace.traceByValue("test4-" + i.toString(), 3 + i);
        }
        console.info("DFX_DFR_Bytrace_0400 end");
        done();
    })

    /**
     * @tc.name   DFX_DFR_Bytrace_0500
     * @tc.number DFX_DFR_Bytrace_0500
     * @tc.desc   DFX_DFR_Bytrace_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_Bytrace_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("-------DFX_DFR_Bytrace_0500 start--------");
        // Normal condition
        let flag = false;
        try {
            console.info("DFX_DFR_Bytrace_0500 1 start")
            bytrace.traceByValue("test5", 5);
            expect(true).assertTrue();
            console.info("DFX_DFR_Bytrace_0500 1 success")
        } catch (err) {
            console.info("DFX_DFR_Bytrace_0500 1 fail!");
            console.info("DFX_DFR_Bytrace_0500 1 err = " + err);
            expect(false).assertTrue();
        }
        // Abnormal condition, Pass only one parameter
        try {
            console.info("DFX_DFR_Bytrace_0500 2 start")
            bytrace.traceByValue("test5");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_Bytrace_0500 2 fail!");
            console.info("DFX_DFR_Bytrace_0500 2 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Pass multiple parameters
        flag = false;
        try {
            console.info("DFX_DFR_Bytrace_0500 3 start")
            bytrace.traceByValue("test5", 3, 1);
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_Bytrace_0500 3 fail!");
            console.info("DFX_DFR_Bytrace_0500 3 err = " + err);
            expect(flag).assertTrue();
        }
        // Abnormal condition, Parameter format mismatch
        flag = false;
        try {
            console.info("DFX_DFR_Bytrace_0500 4 start")
            bytrace.traceByValue(1, "123");
            expect(flag).assertFalse();
        } catch (err) {
            flag = true;
            console.info("DFX_DFR_Bytrace_0500 4 fail!");
            console.info("DFX_DFR_Bytrace_0500 4 err = " + err);
            expect(flag).assertTrue();
        }
        console.info("------DFX_DFR_Bytrace_0500 end------");
        done();
    })
    
    /**
     * @tc.name   DFX_DFR_Bytrace_0600
     * @tc.number DFX_DFR_Bytrace_0600
     * @tc.desc   DFX_DFR_Bytrace_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DFX_DFR_Bytrace_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("-------DFX_DFR_Bytrace_0600 start--------");
        let flag = true;
        try {
            bytrace.startTrace("funcA", 111, undefined);
            expect(flag).assertTrue();
        } catch (err) {
            flag = false;
            console.info("DFX_DFR_Bytrace_0600 fail!");
            console.info("DFX_DFR_Bytrace_0600 err = " + err);
            expect(flag).assertTrue();
        }
        console.info("------DFX_DFR_Bytrace_0600 end------");
        done();
    })

})
}