/*
 * Copyright (C) 2022-2025 Huawei Device Co., Ltd.
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
import workscheduler from '@ohos.resourceschedule.workScheduler'

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

export default function WorkSchedulerPerformanceTest() {
describe("WorkSchedulerPerformanceTest", function () {
    console.log("**********WorkScheduler Performance Test Begin**********")
    performanceStartWork()
    performanceStopWork()
    performanceGetWorkStatusCallback()
    performanceGetWorkStatusPromise()
    performanceObtainAllWorksCallback()
    performanceObtainAllWorksPromise()
    performanceIsLastWorkTimeOutCallback()
    performanceIsLastWorkTimeOutPromise()
    performanceStopAndClearWorks()
    performanceObtainAllWorksCallbackresIsNull()
    performanceObtainAllWorksPromiseresIsNull()
    console.log("**********WorkScheduler Performance Test End**********")
})

function performanceStartWork() {
    /**
     * @tc.name   WorkSchedulerPerformance_001
     * @tc.number WorkSchedulerPerformance_001
     * @tc.desc   WorkSchedulerPerformance_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkSchedulerPerformance_001', Level.LEVEL0, async function(done) {
        workscheduler.stopAndClearWorks()
        let totalTime = 0
        let workInfo = {
            workId: 201,
            batteryStatus: workscheduler.BatteryStatus.BATTERY_STATUS_LOW,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "ohos.acts.resourceschedule.workscheduler.js.function.WorkSchedulerAppService"
        }
        let startTime = new Date().getTime()
        try{
            workscheduler.startWork(workInfo)
        } catch (error) {
            expect(true).assertEqual(false)
        }
        totalTime = new Date().getTime() - startTime
        console.info('WorkSchedulerPerformance_001: startWork WaitTime: ' + totalTime + 'ms')
        done()
    })
}

function performanceStopWork() {
    /**
     * @tc.name   WorkSchedulerPerformance_002
     * @tc.number WorkSchedulerPerformance_002
     * @tc.desc   WorkSchedulerPerformance_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkSchedulerPerformance_002', Level.LEVEL0, async function(done) {
        workscheduler.stopAndClearWorks()
        let totalTime = 0
        let workingInfo = {
            workId: 202,
            batteryStatus: workscheduler.BatteryStatus.BATTERY_STATUS_LOW,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "ohos.acts.resourceschedule.workscheduler.js.function.WorkSchedulerAppService"
        }
        try{
            workscheduler.startWork(workingInfo)
        } catch (error) {
            expect(true).assertEqual(false)
        }
        let workInfo = {
            workId: 202,
            batteryStatus: workscheduler.BatteryStatus.BATTERY_STATUS_LOW,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "ohos.acts.resourceschedule.workscheduler.js.function.WorkSchedulerAppService"
        }
        let startTime = new Date().getTime()
        try{
            workscheduler.stopWork(workInfo, false)
        } catch (error) {
            expect(true).assertEqual(false)
        }
        workscheduler.stopWork(workInfo, false)
        totalTime= new Date().getTime() - startTime
        console.info('WorkSchedulerPerformance_002: stopWork WaitTime: ' + totalTime + 'ms')
        done()
    })
}

function performanceGetWorkStatusCallback() {
    /**
     * @tc.name   WorkSchedulerPerformance_003
     * @tc.number WorkSchedulerPerformance_003
     * @tc.desc   WorkSchedulerPerformance_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkSchedulerPerformance_003', Level.LEVEL0, async function(done) {
        workscheduler.stopAndClearWorks()
        let workInfo = {
            workId: 203,
            storageRequest: workscheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "ohos.acts.resourceschedule.workscheduler.js.function.WorkSchedulerAppService"
        }
        try{
            workscheduler.startWork(workInfo)
        } catch (error) {
            expect(true).assertEqual(false)
            done()
        }
        let startTime = new Date().getTime()
        try{
            await workscheduler.getWorkStatus(203, (err, res) => {
                let totalTime = new Date().getTime() - startTime
                console.info('WorkSchedulerPerformance_003: getWorkStatus callback WaitTime: ' + totalTime + 'ms')
                done()
            })
        } catch (error) {
            done()
        }
    })
}

function performanceGetWorkStatusPromise() {
    /**
     * @tc.name   WorkSchedulerPerformance_004
     * @tc.number WorkSchedulerPerformance_004
     * @tc.desc   WorkSchedulerPerformance_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkSchedulerPerformance_004', Level.LEVEL0, async function(done) {
        workscheduler.stopAndClearWorks()
        let workInfo = {
            workId: 204,
            storageRequest: workscheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "ohos.acts.resourceschedule.workscheduler.js.function.WorkSchedulerAppService"
        }
        try{
            workscheduler.startWork(workInfo)
        } catch (error) {
            expect(true).assertEqual(false)
            done()
        }
        let startTime = new Date().getTime()
        startTime = new Date().getTime()
        try{
            await workscheduler.getWorkStatus(204)
                .then((res) => {
                    let totalTime = new Date().getTime() - startTime
                    console.info('WorkSchedulerPerformance_004: getWorkStatus promise WaitTime: ' + totalTime + 'ms')
                    done()
                })
                .catch((err) => {
                    done()
                })
        } catch (error) {
            done()
        }
    })
}

function performanceObtainAllWorksCallback() {
    /**
     * @tc.name   WorkSchedulerPerformance_005
     * @tc.number WorkSchedulerPerformance_005
     * @tc.desc   WorkSchedulerPerformance_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkSchedulerPerformance_005', Level.LEVEL0, async function(done) {
        workscheduler.stopAndClearWorks()
        let workInfo = {
            workId: 205,
            storageRequest: workscheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "ohos.acts.resourceschedule.workscheduler.js.function.WorkSchedulerAppService"
        }
        try{
            workscheduler.startWork(workInfo)
        } catch (error) {
            expect(true).assertEqual(false)
            done()
        }
        let startTime = new Date().getTime()
        try{
            await workscheduler.obtainAllWorks((err, res) => {
                console.info('WorkSchedulerPerformance_005 obtainAllWorks callback success, res is:' + JSON.stringify(res));
                console.info('WorkSchedulerPerformance_005 obtainAllWorks callback success, res.length is:' + res.length);
                let totalTime = new Date().getTime() - startTime
                console.info('WorkSchedulerPerformance_005: obtainAllWorks callback WaitTime: ' + totalTime + 'ms')
                expect(res.length).assertLarger(0);
                done()
            })
        } catch (error) {
            done()
        }
    })
}

function performanceObtainAllWorksPromise() {
    /**
     * @tc.name   WorkSchedulerPerformance_006
     * @tc.number WorkSchedulerPerformance_006
     * @tc.desc   WorkSchedulerPerformance_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkSchedulerPerformance_006', Level.LEVEL0, async function(done) {
        workscheduler.stopAndClearWorks()
        let workInfo = {
            workId: 206,
            storageRequest: workscheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "ohos.acts.resourceschedule.workscheduler.js.function.WorkSchedulerAppService"
        }
        try{
            workscheduler.startWork(workInfo)
        } catch (error) {
            expect(true).assertEqual(false)
            done()
        }
        let startTime = new Date().getTime()
        try{
            await workscheduler.obtainAllWorks()
                .then((res) => {
                    console.info('WorkSchedulerPerformance_006 obtainAllWorks promise success, res is:' + JSON.stringify(res));
                    console.info('WorkSchedulerPerformance_006 obtainAllWorks promise success, res.length is:' + res.length);
                    let totalTime = new Date().getTime() - startTime
                    console.info('WorkSchedulerPerformance_006: obtainAllWorks promise WaitTime: ' + totalTime + 'ms')
                    expect(res.length).assertLarger(0);
                    done()
                })
                .catch((err) => {
                    done()
                })
        } catch (error) {
            done()
        }
    })
}

function performanceIsLastWorkTimeOutCallback() {
    /**
     * @tc.name   WorkSchedulerPerformance_007
     * @tc.number WorkSchedulerPerformance_007
     * @tc.desc   WorkSchedulerPerformance_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkSchedulerPerformance_007', Level.LEVEL0, async function(done) {
        workscheduler.stopAndClearWorks()
        let workInfo = {
            workId: 207,
            storageRequest: workscheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "ohos.acts.resourceschedule.workscheduler.js.function.WorkSchedulerAppService"
        }
        try{
            workscheduler.startWork(workInfo)
        } catch (error) {
            expect(true).assertEqual(false)
            done()
        }
        let startTime = new Date().getTime()
        try{
            await workscheduler.isLastWorkTimeOut(207, (err, res) => {
                console.info('WorkSchedulerPerformance_007 isLastWorkTimeOut callback success, res is:' + res);
                let totalTime = new Date().getTime() - startTime
                console.info('WorkSchedulerPerformance_007: isLastWorkTimeOut callback WaitTime: ' + totalTime + 'ms')
                expect(res == false).assertTrue();
                done()
            })
        } catch (error) {
            done()
        }
    })
}

function performanceIsLastWorkTimeOutPromise() {
    /**
     * @tc.name   WorkSchedulerPerformance_008
     * @tc.number WorkSchedulerPerformance_008
     * @tc.desc   WorkSchedulerPerformance_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkSchedulerPerformance_008', Level.LEVEL0, async function(done) {
        workscheduler.stopAndClearWorks()
        let workInfo = {
            workId: 208,
            storageRequest: workscheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "ohos.acts.resourceschedule.workscheduler.js.function.WorkSchedulerAppService"
        }
        try{
            workscheduler.startWork(workInfo)
        } catch (error) {
            expect(true).assertEqual(false)
            done()
        }
        let startTime = new Date().getTime()
        try{
            await workscheduler.isLastWorkTimeOut(208)
                .then((res) => {
                    console.info('WorkSchedulerPerformance_008 isLastWorkTimeOut promise success, res is:' + res);
                    let totalTime = new Date().getTime() - startTime
                    console.info('WorkSchedulerPerformance_008: isLastWorkTimeOut promise WaitTime: ' + totalTime + 'ms')
                    expect(res == false).assertTrue();
                    done()
                })
                .catch((err) => {
                    done()
                })
        } catch (error) {
            done()
        }
    })
}

function performanceStopAndClearWorks() {
    /**
     * @tc.name   WorkSchedulerPerformance_009
     * @tc.number WorkSchedulerPerformance_009
     * @tc.desc   WorkSchedulerPerformance_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkSchedulerPerformance_009', Level.LEVEL0, function() {
        workscheduler.stopAndClearWorks()
        let workInfo = {
            workId: 209,
            storageRequest: workscheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "ohos.acts.resourceschedule.workscheduler.js.function.WorkSchedulerAppService"
        }
        try{
            workscheduler.startWork(workInfo)
        } catch (error) {
            expect(true).assertEqual(false)
            done()
        }
        let startTime = new Date().getTime()
        workscheduler.stopAndClearWorks()
        let totalTime = new Date().getTime() - startTime
        console.info('WorkSchedulerPerformance_009: stopAndClearWorks WaitTime: ' + totalTime + 'ms')
    })
}

function performanceObtainAllWorksCallbackresIsNull() {
        /**
         * @tc.name   WorkSchedulerPerformance_010
         * @tc.number WorkSchedulerPerformance_010
         * @tc.desc   WorkSchedulerPerformance_010
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("WorkSchedulerPerformance_010", Level.LEVEL0, async function (done) {
            console.info('----------------------testStartWorkFun055---------------------------');
            workscheduler.stopAndClearWorks()
            try{
                await workscheduler.obtainAllWorks((err, res) => {
                    console.info('WorkSchedulerPerformance_010 obtainAllWorks callback success, res is:' + JSON.stringify(res));
                    console.info('WorkSchedulerPerformance_010 obtainAllWorks callback success, res.length is:' + res.length);
                    expect(res.length).assertEqual(0);
                    done();
                })
            } catch (error) {
                done()
            }
        })
}

function performanceObtainAllWorksPromiseresIsNull() {
        /**
         * @tc.name   WorkSchedulerPerformance_011
         * @tc.number WorkSchedulerPerformance_011
         * @tc.desc   WorkSchedulerPerformance_011
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("WorkSchedulerPerformance_011", Level.LEVEL0, async function (done) {
            console.info('----------------------testStartWorkFun055---------------------------');
            workscheduler.stopAndClearWorks()
            try{
                await workscheduler.obtainAllWorks()
                    .then((res) => {
                        console.info('WorkSchedulerPerformance_011 obtainAllWorks promise success, res is:' + JSON.stringify(res));
                        console.info('WorkSchedulerPerformance_011 obtainAllWorks promise success, res.length is:' + res.length);
                        expect(res.length).assertEqual(0);
                        done();
                    })
                    .catch((err) => {
                        done()
                    })
            } catch (error) {
                done()
            }
        })
}
}
