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

import runningLock from '@ohos.runningLock';
import power from '@ohos.power';
import brightness from '@ohos.brightness';
import { describe, it, expect } from '@ohos/hypium';

export default function PowerPerformanceTest() {
describe('PowerPerformanceTest', function () {

    console.log("*************Power Performance Test Begin*************");
    const MAXNUM = 1000;
    const MIDNUM = 100;
    const MS_TO_US = 1000;
    const LIMIT_TIME = 1500;
    const LIMIT_TIME_LONG = 4000;

    /**
     * @tc.number PowerPerformance_001
     * @tc.name createRunningLock_test
     * @tc.desc Interface is called normally
     */
    it('PowerPerformance_001', 0, async function (done) {
        let startTime = new Date().getTime();
        for (let i = 0; i < MIDNUM; i++) {
            await runningLock.createRunningLock("test", runningLock.RunningLockType.BACKGROUND)
        }
        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MIDNUM * MS_TO_US; //us
        console.info(`POWER_Performance_001: Promise: runningLock.createRunningLock Wait Time : ${waitTime}`);
        avgTime < LIMIT_TIME_LONG ? expect(true).assertTrue() : expect(false).assertTrue();
        done();
    })

    /**
     * @tc.number PowerPerformance_003
     * @tc.name lock_test
     * @tc.desc Interface is called normally
     */
    it('PowerPerformance_003', 0, async function (done) {
        let avgTime = 0;
        runningLock.createRunningLock("test", runningLock.RunningLockType.BACKGROUND, (error, runningLock) => {
            if (typeof error === "undefined") {
                let startTime = new Date().getTime();
                for (let i = 0; i < MAXNUM; i++) {
                    runningLock.lock(500);
                }
                let waitTime = new Date().getTime() - startTime;
                avgTime = avgTime + waitTime; //us
                console.info(`PowerPerformance_003: Promise: runningLock.lock Wait Time : ${waitTime}`);
                avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
                runningLock.unlock();
                done();
            } else {
                console.log('PowerPerformance_003: ' + error);
                console.info('PowerPerformance_003: lock is ' + runningLock);
                done();
            }
        })
    })

    /**
     * @tc.number PowerPerformance_004
     * @tc.name unlock_test
     * @tc.desc Interface is called normally
     */
    it('PowerPerformance_004', 0, async function (done) {
        let avgTime = 0;
        runningLock.createRunningLock("test", runningLock.RunningLockType.BACKGROUND, (error, runningLock) => {
            if (typeof error === "undefined") {
                runningLock.lock(500);
                let startTime = new Date().getTime();
                for (let i = 0; i < MAXNUM; i++) {
                    runningLock.unlock();
                }
                let waitTime = new Date().getTime() - startTime;
                avgTime = avgTime + waitTime; //us
                console.info(`PowerPerformance_004: Promise: runningLock.unlock Wait Time : ${waitTime}`);
                avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
                done();
            } else {
                console.log('PowerPerformance_004: ' + error);
                console.info('PowerPerformance_004: lock is ' + runningLock);
                done();
            }
        })
    })

    /**
     * @tc.number PowerPerformance_005
     * @tc.name isProximitySupported_test
     * @tc.desc Interface is called normally
     */
    it('PowerPerformance_005', 0, async function (done) {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            await runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
        }
        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`PowerPerformance_005: Promise: await runningLock.isRunningLockTypeSupported Wait Time :
            ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
        done();
    })

    /**
     * @tc.number PowerPerformance_006
     * @tc.name isScreenOn_test
     * @tc.desc AsyncCallback<boolean> judge whether the screen is lit and return to true
     */
    it('PowerPerformance_006', 0, async function (done) {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            await power.isScreenOn()
        }
        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`PowerPerformance_006: Promise: await power.isScreenOn Wait Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
        done();
    })

    /**
     * @tc.number PowerPerformance_007
     * @tc.name setValue_test
     * @tc.desc Interface is called normally
     */
    it('PowerPerformance_007', 0, function () {
        let startTime = new Date().getTime();
        for (let i = 0; i < MAXNUM; i++) {
            brightness.setValue(100);
        }
        let waitTime = new Date().getTime() - startTime;
        let avgTime = waitTime / MAXNUM * MS_TO_US; //us
        console.info(`PowerPerformance_007: Promise: brightness.setValue Wait Time : ${waitTime}`);
        avgTime < LIMIT_TIME ? expect(true).assertTrue() : expect(false).assertTrue();
    })

})
}
