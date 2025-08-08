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
import workscheduler from '@ohos.resourceschedule.workScheduler'

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

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
    console.log("**********WorkScheduler Performance Test End**********")
})

function performanceStartWork() {
    it('WorkSchedulerPerformance_001', 0, async function(done) {
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
    it('WorkSchedulerPerformance_002', 0, async function(done) {
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
    it('WorkSchedulerPerformance_003', 0, async function(done) {
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
    it('WorkSchedulerPerformance_004', 0, async function(done) {
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
    it('WorkSchedulerPerformance_005', 0, async function(done) {
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
                let totalTime = new Date().getTime() - startTime
                console.info('WorkSchedulerPerformance_005: obtainAllWorks callback WaitTime: ' + totalTime + 'ms')
                done()
            })
        } catch (error) {
            done()
        }
    })
}

function performanceObtainAllWorksPromise() {
    it('WorkSchedulerPerformance_006', 0, async function(done) {
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
                    let totalTime = new Date().getTime() - startTime
                    console.info('WorkSchedulerPerformance_006: obtainAllWorks promise WaitTime: ' + totalTime + 'ms')
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
    it('WorkSchedulerPerformance_007', 0, async function(done) {
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
                let totalTime = new Date().getTime() - startTime
                console.info('WorkSchedulerPerformance_007: isLastWorkTimeOut callback WaitTime: ' + totalTime + 'ms')
                done()
            })
        } catch (error) {
            done()
        }
    })
}

function performanceIsLastWorkTimeOutPromise() {
    it('WorkSchedulerPerformance_008', 0, async function(done) {
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
                    let totalTime = new Date().getTime() - startTime
                    console.info('WorkSchedulerPerformance_008: isLastWorkTimeOut promise WaitTime: ' + totalTime + 'ms')
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
    it('WorkSchedulerPerformance_009', 0, function() {
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
}
