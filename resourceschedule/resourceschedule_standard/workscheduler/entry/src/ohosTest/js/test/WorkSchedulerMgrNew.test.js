/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import workScheduler from '@ohos.resourceschedule.workScheduler'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

export default function WorkSchedulerMgrNewTest() {
    describe("WorkSchedulerMgrNewTest", function () {
        beforeAll(function() {

            /*
             * @tc.setup: setup invoked before all testcases
             */
             console.info('beforeAll caled')
        })

        afterAll(function() {

            /*
             * @tc.teardown: teardown invoked after all testcases
             */
             console.info('afterAll caled')
        })

        beforeEach(function() {

            /*
             * @tc.setup: setup invoked before each testcases
             */
             console.info('beforeEach caled')
        })

        afterEach(function() {

            /*
             * @tc.teardown: teardown invoked after each testcases
             */
             console.info('afterEach caled')
        })

    /**
     * @tc.name   WorkSchedulerMgrNEW001
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_NEW_XTS_001
     * @tc.desc   workScheduler startWork IS NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerMgrNEW001", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerMgrNEW001---------------------------');
        workScheduler.stopAndClearWorks();
        try{
            expect(workScheduler.startWork(null));
        }catch(error){
            console.info("WorkSchedulerMgrNEW001 ----------------error: " + error.code);
            expect(error.code).assertEqual("401");
            done();
        }
    })
    /**
     * @tc.name   WorkSchedulerMgrNEW002
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_NEW_XTS_002
     * @tc.desc   workScheduler startWork IS undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerMgrNEW002", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerMgrNEW002---------------------------');
        workScheduler.stopAndClearWorks();
        try{
            expect(workScheduler.startWork(undefined));
        }catch(error){
            console.info("WorkSchedulerMgrNEW002----------------error: " + error.code);
            expect(error.code).assertEqual("401");
            done();
        }
    })
    /**
     * @tc.name   WorkSchedulerMgrNEW003
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_NEW_XTS_003
     * @tc.desc   workScheduler stopWork IS undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerMgrNEW003", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerMgrNEW003---------------------------');
        workScheduler.stopAndClearWorks();
        try{
            expect(workScheduler.stopWork(undefined));
        }catch(error){
            console.info("WorkSchedulerMgrNEW003----------------error: " + error.code);
            expect(error.code).assertEqual("401");
            done();
        }
    })
    /**
     * @tc.name   WorkSchedulerMgrNEW004
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_NEW_XTS_004
     * @tc.desc   workScheduler stopWork IS null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerMgrNEW004", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerMgrNEW004---------------------------');
        workScheduler.stopAndClearWorks();
        try{
            expect(workScheduler.stopWork(null));
        }catch(error){
            console.info("WorkSchedulerMgrNEW004----------------error: " + error.code);
            expect(error.code).assertEqual("401");
            done();
        }
    })
    /**
     * @tc.name   WorkSchedulerMgrNEW005
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_NEW_XTS_005
     * @tc.desc   BatteryStatus is BATTERY_STATUS_OKAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerMgrNEW005", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerMgrNEW005---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_OKAY
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("WorkSchedulerMgrNEW005 ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("WorkSchedulerMgrNEW005getWorkStatus promise success,data is" +
                JSON.stringify(res));
                expect(res.batteryStatus).assertEqual(1)
            })
            done();
        }catch(error){
            console.info("WorkSchedulerMgrNEW005 ----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   WorkSchedulerMgrNEW006
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_NEW_XTS_006
     * @tc.desc   BatteryStatus is BATTERY_STATUS_LOW_OR_OKAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerMgrNEW006", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerMgrNEW006---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_LOW_OR_OKAY
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("WorkSchedulerMgrNEW006 ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("WorkSchedulerMgrNEW006 getWorkStatus promise success,data is" +
                JSON.stringify(res));
                expect(res.batteryStatus).assertEqual(2)
            })
            done();
        }catch(error){
            console.info("WorkSchedulerMgrNEW006 ----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   WorkSchedulerMgrNEW007
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_NEW_XTS_007
     * @tc.desc   networkType is NETWORK_TYPE_WIFI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerMgrNEW007", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerMgrNEW007---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            networkType: workScheduler.NetworkType.NETWORK_TYPE_WIFI
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("WorkSchedulerMgrNEW007 ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("WorkSchedulerMgrNEW007 getWorkStatus promise success,data is" +
                JSON.stringify(res));
                expect(res.networkType).assertEqual(2)
            })
            done();
        }catch(error){
            console.info("WorkSchedulerMgrNEW007 ----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   WorkSchedulerMgrNEW008
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_NEW_XTS_008
     * @tc.desc   networkType is NETWORK_TYPE_BLUETOOTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerMgrNEW008", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerMgrNEW008---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            networkType: workScheduler.NetworkType.NETWORK_TYPE_BLUETOOTH
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("WorkSchedulerMgrNEW008 ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("WorkSchedulerMgrNEW008 getWorkStatus promise success,data is" +
                JSON.stringify(res));
                expect(res.networkType).assertEqual(3)
            })
            done();
        }catch(error){
            console.info("WorkSchedulerMgrNEW008 ----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   WorkSchedulerMgrNEW009
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_NEW_XTS_009
     * @tc.desc   networkType is NETWORK_TYPE_WIFI_P2P
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerMgrNEW009", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerMgrNEW009---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            networkType: workScheduler.NetworkType.NETWORK_TYPE_WIFI_P2P
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("WorkSchedulerMgrNEW009 ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("WorkSchedulerMgrNEW009 getWorkStatus promise success,data is" +
                JSON.stringify(res));
                expect(res.networkType).assertEqual(4)
            })
            done();
        }catch(error){
            console.info("WorkSchedulerMgrNEW009 ----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkFun010
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_NEW_XTS_010
     * @tc.desc    networkType is NETWORK_TYPE_ETHERNET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkFun010", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkFun010---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            networkType: workScheduler.NetworkType.NETWORK_TYPE_ETHERNET
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkFun010 ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkFun010 getWorkStatus promise success,data is" +
                JSON.stringify(res));
                expect(res.networkType).assertEqual(5)
            })
            done();
        }catch(error){
            console.info("testStartWorkFun010 ----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW011
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_011
     * @tc.desc   stopWork and getWorkStatus chargerType is CHARGING_PLUGGED_ANY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW011", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW011---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            isCharging: true,
            chargerType: workScheduler.ChargingType.CHARGING_PLUGGED_ANY
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW011 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkNEW011 getWorkStatus promise success, data is:" +
                JSON.stringify(res));
                expect(res.isCharging).assertEqual(true);
                expect(res.chargerType).assertEqual(0);
            })
            done();
        }catch(error){
            console.info("testStartWorkNEW011 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW012
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_012
     * @tc.desc   stopWork and getWorkStatus chargerType is CHARGING_PLUGGED_AC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW012", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW012---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            isCharging: true,
            chargerType: workScheduler.ChargingType.CHARGING_PLUGGED_AC
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW012 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkNEW012 getWorkStatus promise success, data is:" +
                JSON.stringify(res));
                expect(res.isCharging).assertEqual(true);
                expect(res.chargerType).assertEqual(1);
            })
            done();
        }catch(error){
            console.info("testStartWorkNEW012 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW013
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_013
     * @tc.desc   stopWork and getWorkStatus chargerType is CHARGING_PLUGGED_USB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW013", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW013---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            isCharging: true,
            chargerType: workScheduler.ChargingType.CHARGING_PLUGGED_USB
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW013 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkNEW013 getWorkStatus promise success, data is:" +
                JSON.stringify(res));
                expect(res.isCharging).assertEqual(true);
                expect(res.chargerType).assertEqual(2);
            })
            done();
        }catch(error){
            console.info("testStartWorkNEW013 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW014
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_014
     * @tc.desc   stopWork and getWorkStatus chargerType is CHARGING_PLUGGED_WIRELESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW014", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW014---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            isCharging: true,
            chargerType: workScheduler.ChargingType.CHARGING_PLUGGED_WIRELESS
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW014 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkNEW014 getWorkStatus promise success, data is:" +
                JSON.stringify(res));
                expect(res.isCharging).assertEqual(true);
                expect(res.chargerType).assertEqual(3);
            })
            done();
        }catch(error){
            console.info("testStartWorkNEW014 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW015
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_015
     * @tc.desc   stopWork and getWorkStatus storageRequest is STORAGE_LEVEL_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW015", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW015---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_LOW
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW015 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkNEW015 getWorkStatus promise success, data is:" +
                JSON.stringify(res));
                expect(res.storageRequest).assertEqual(0);
            })
            done();
        }catch(error){
            console.info("testStartWorkNEW015 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW016
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_016
     * @tc.desc   stopWork and getWorkStatus storageRequest is STORAGE_LEVEL_LOW_OR_OKAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW016", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW016---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW016 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkNEW016 getWorkStatus promise success, data is:" +
                JSON.stringify(res));
                expect(res.storageRequest).assertEqual(1);
            })
            done();
        }catch(error){
            console.info("testStartWorkNEW016 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW018
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_018
     * @tc.desc   stopWork and getWorkStatus isCharging is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW018", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW018---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            isCharging: false
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW018 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkNEW018 getWorkStatus promise success, data is:" +
                JSON.stringify(res));
                expect(res.isCharging).assertEqual(false);
            })
            done();
        }catch(error){
            console.info("testStartWorkNEW018 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW020
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_020
     * @tc.desc   stopWork and getWorkStatus isDeepIdle is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW020", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW020---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            networkType: 0,
            isCharging: false,
            batteryLevel: 50,
            batteryStatus: 1,
            storageRequest: 1,
            isRepeat: false,
            isPersisted: false,
            isDeepIdle: false
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW020 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkNEW020 getWorkStatus promise success, data is:" +
                JSON.stringify(res));
                expect(res.isDeepIdle).assertEqual(false);
                expect(res.isRepeat).assertEqual(false);
            })
            done();
        }catch(error){
            console.info("testStartWorkNEW020 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW021
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_021
     * @tc.desc   stopWork and getWorkStatus isDeepIdle is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW021", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW021---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            networkType: 0,
            isCharging: true,
            chargerType: 0,
            batteryLevel: 20,
            batteryStatus: 0,
            storageRequest: 0,
            isRepeat: true,
            repeatCycleTime: 1200000,
            repeatCount: 2,
            isPersisted: true,
            isDeepIdle: true,
            idleWaitTime: 3000
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW021 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkNEW021 getWorkStatus promise success, data is:" +
                JSON.stringify(res));
                expect(res.isDeepIdle).assertEqual(true);
                expect(res.isPersisted).assertEqual(true);
            })
            done();
        }catch(error){
            console.info("testStartWorkNEW021 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW022
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_022
     * @tc.desc   test getWorkStatus callback null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW022", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW022---------------------------');
        try{
            workScheduler.getWorkStatus(null, (err, res) => {
                if (err) {
                    console.info('testStartWorkNEW022 isLastWorkTimeOut callback failed, err:' + err.code);
                } else {
                    console.info('testStartWorkNEW022 isLastWorkTimeOut callback sucess, data is:' + res);
                }
            });
        }catch(error){
            console.info(`testStartWorkNEW022 failed, code is ${error.code} message is ${error.message}`);
            expect(error.code).assertEqual("401");
            done();
        }
    })
    /**
     * @tc.name   testStartWorkNEW023
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_023
     * @tc.desc   test getWorkStatus callback undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW023", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW023---------------------------');
        try{
            workScheduler.getWorkStatus(undefined, (err, res) => {
                if (err) {
                    console.info('testStartWorkNEW023 isLastWorkTimeOut callback failed, err:' + err.code);
                } else {
                    console.info('testStartWorkNEW023 isLastWorkTimeOut callback sucess, data is:' + res);
                }
            });
        }catch(error){
            console.info(`testStartWorkNEW023 failed, code is ${error.code} message is ${error.message}`);
            expect(error.code).assertEqual("401");
            done();
        }
    })
    /**
     * @tc.name   testStartWorkNEW024
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_024
     * @tc.desc   stopWork and getWorkStatus all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW024", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW024---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            isPersisted: false,
            networkType: workScheduler.NetworkType.NETWORK_TYPE_ANY,
            isCharging: true,
            chargerType: 0,
            batteryLevel: 20,
            batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_LOW,
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY,
            isRepeat: true,
            repeatCycleTime: 1200000,
            repeatCount: 2,
            isDeepIdle: true,
            idleWaitTime: 3000,
            parameters: {
                mykey0: 1,
                mykey1: "string value",
                mykey2: true,
                mykey3: 1.5
            },
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW024 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkNEW024 getWorkStatus promise success, data is:" +
                JSON.stringify(res));
                expect(res.workId).assertEqual(1);
                expect(res.bundleName).assertEqual(ohos.acts.resourceschedule.workScheduler.js.function);
                expect(res.abilityName).assertEqual(com.mytest.abilityName);
                expect(res.isPersisted).assertEqual(false);
                expect(res.networkType).assertEqual(1);
                expect(res.isCharging).assertEqual(true);
                expect(res.batteryLevel).assertEqual(20);
                expect(res.batteryStatus).assertEqual(1);
                expect(res.storageRequest).assertEqual(1);
                expect(res.isRepeat).assertEqual(true);
                expect(res.repeatCycleTime).assertEqual(1200000);
                expect(res.isDeepIdle).assertEqual(true);
                expect(res.idleWaitTime).assertEqual(3000);
                expect(res.parameters).toEqual({
                    mykey0: 1,
                    mykey1: "string value",
                    mykey2: true,
                    mykey3: 1.5
                });
            })
            done();
        }catch(error){
            console.info("testStartWorkNEW024 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW025
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_025
     * @tc.desc   stopWork and getWorkStatus networkType is NETWORK_TYPE_MOBILE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW025", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW025---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            networkType: workScheduler.NetworkType.NETWORK_TYPE_MOBILE
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW025 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1).then((res) => {
                console.info("testStartWorkNEW025 getWorkStatus promise success, data is:" +
                JSON.stringify(res));
                expect(res.networkType).assertEqual(1);
            })
            done();
        }catch(error){
            console.info("testStartWorkNEW025 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW026
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_026
     * @tc.desc   callback getWorkStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW026", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW026---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            isPersisted: false,
            networkType: workScheduler.NetworkType.NETWORK_TYPE_ANY,
            isCharging: true,
            chargerType: 0,
            batteryLevel: 20,
            batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_LOW,
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY,
            isRepeat: true,
            repeatCycleTime: 1200000,
            repeatCount: 2,
            isDeepIdle: true,
            idleWaitTime: 3000,
            parameters: {
                mykey0: 1,
                mykey1: "string value",
                mykey2: true,
                mykey3: 1.5
            },
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW026 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1,(err,res) => {
                console.info("testStartWorkNEW026 getWorkStatus callback success, data is:" +
                    JSON.stringify(res));
                    expect(res.workId).assertEqual(1);
                    expect(res.bundleName).assertEqual(ontouchstart.acts.resourceschedule.workScheduler.js.function);
                    expect(res.abilityName).assertEqual(com.mytest.abilityName);
                    expect(res.isPersisted).assertEqual(false);
                    expect(res.networkType).assertEqual(1);
                    expect(res.isCharging).assertEqual(true);
                    expect(res.batteryLevel).assertEqual(20);
                    expect(res.batteryStatus).assertEqual(1);
                    expect(res.storageRequest).assertEqual(1);
                    expect(res.isRepeat).assertEqual(true);
                    expect(res.repeatCycleTime).assertEqual(1200000);
                    expect(res.isDeepIdle).assertEqual(true);
                    expect(res.idleWaitTime).assertEqual(3000);
                    expect(res.parameters).toEqual({
                        mykey0: 1,
                        mykey1: "string value",
                        mykey2: true,
                        mykey3: 1.5
                    });
            });
            done();
        }catch(error){
            console.info("testStartWorkNEW026 stop----------------error: " + error.code);
        }
    })
    /**
     * @tc.name   testStartWorkNEW027
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_027
     * @tc.desc   isLastWorkTimeOut Promise null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW027", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW027---------------------------');
        try{
            workScheduler.isLastWorkTimeOut(null).then(res => {
                console.info('testStartWorkNEW027 workscheduleLog isLastWorkTimeOut success' + res);
            }).catch(err => {
                console.info('testStartWorkNEW027 workscheduleLog isLastWorkTimeOut failed, cause:' + err.code);
            });
        }catch(error){
            console.info(`testStartWorkNEW027 failed, code is ${error.code} message is ${error.message}`);
            expect(error.code).assertEqual("401");
            done();
        }
    })
    /**
     * @tc.name   testStartWorkNEW028
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_028
     * @tc.desc   isLastWorkTimeOut Promise undifined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW028", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW028---------------------------');
        try{
            workScheduler.isLastWorkTimeOut(undefined).then(res => {
                console.info('testStartWorkNEW028 workscheduleLog isLastWorkTimeOut success' + res);
            }).catch(err => {
                console.info('testStartWorkNEW028 workscheduleLog isLastWorkTimeOut failed, cause:' + err.code);
            });
        }catch(error){
            console.info(`testStartWorkNEW028 failed, code is ${error.code} message is ${error.message}`);
            expect(error.code).assertEqual("401");
            done();
        }
    })
    /**
     * @tc.name   testStartWorkNEW029
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_029
     * @tc.desc   test isLastWorkTimeOut callback undifined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW029", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW029---------------------------');
        try{
            workScheduler.getWorkStatus(undefined, (err, res) => {
                if (err) {
                    console.error(`testStartWorkNEW029 isLastWorkTimeOut failed. code is ${err.code} message is ${err.message}`);
                } else {
                    console.info(`testStartWorkNEW029 workscheduleLog isLastWorkTimeOut success, data is: ${res}`);
                }
            });
        }catch(error){
            console.info(`testStartWorkNEW029 failed, code is ${error.code} message is ${error.message}`);
            expect(error.code).assertEqual("401");
            done();
        }
    })

    /**
     * @tc.name   testStartWorkNEW030
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_030
     * @tc.desc   test isLastWorkTimeOut callback null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW030", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW030---------------------------');
        try{
            workScheduler.getWorkStatus(null, (err, res) => {
                if (err) {
                    console.error(`testStartWorkNEW030 isLastWorkTimeOut failed. code is ${err.code} message is ${err.message}`);
                } else {
                    console.info(`testStartWorkNEW030 workscheduleLog isLastWorkTimeOut success, data is: ${res}`);
                }
            });
        }catch(error){
            console.info(`testStartWorkNEW030 failed, code is ${error.code} message is ${error.message}`);
            expect(error.code).assertEqual("401");
            done();
        }
    })
    /**
     * @tc.name   testStartWorkNEW031
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_031
     * @tc.desc   NetworkType callback getWorkStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW031", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW031---------------------------');
        const networkCases = [
            {
                name: "NETWORK_TYPE_WIFI",
                value: workScheduler.NetworkType.NETWORK_TYPE_WIFI,
                expected: 2
            },
            {
                name: "NETWORK_TYPE_BLUETOOTH",
                value: workScheduler.NetworkType.NETWORK_TYPE_BLUETOOTH,
                expected: 3
            },
            {
                name: "NETWORK_TYPE_WIFI_P2P",
                value: workScheduler.NetworkType.NETWORK_TYPE_WIFI_P2P,
                expected: 4
            },
            {
                name: "NETWORK_TYPE_ETHERNET",
                value: workScheduler.NetworkType.NETWORK_TYPE_ETHERNET,
                expected: 5
            },
            {
                name: "NETWORK_TYPE_MOBILE",
                value: workScheduler.NetworkType.NETWORK_TYPE_MOBILE,
                expected: 1
            }
        ];
        for (const testCase of networkCases) {
            console.info(`Testing networkType: ${testCase.name}`);
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: testCase.value
            };
            try{
                workScheduler.startWork(workInfo);
                workScheduler.getWorkStatus(1, (err, res) => {
                    console.info(`getWorkStatus success, data: ${JSON.stringify(res)}`);
                    expect(res.networkType).assertEqual(testCase.expected);
                })
                workScheduler.stopWork(workInfo);
            }catch(error){
                console.error(`testStartWorkNEW031 Test failed for ${testCase.name}: ${error.code}`);
                expect.fail(`testStartWorkNEW031 Test failed for ${testCase.name}: ${error.code}`);
            }
    }
    done();
    });

    /**
     * @tc.name   testStartWorkNEW032
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_032
     * @tc.desc   stopWork and getWorkStatus for all chargerType enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW032", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW031---------------------------');
        workScheduler.stopAndClearWorks();
        const chargerTypeCases = [
            {
                name: "CHARGING_PLUGGED_AC",
                value: workScheduler.ChargingType.CHARGING_PLUGGED_AC,
                expected: 1
            },
            {
                name: "CHARGING_PLUGGED_USB",
                value: workScheduler.ChargingType.CHARGING_PLUGGED_USB,
                expected: 2
            },
            {
                name: "CHARGING_PLUGGED_WIRELESS",
                value: workScheduler.ChargingType.CHARGING_PLUGGED_WIRELESS,
                expected: 3
            }
        ];
        for (const testCase of chargerTypeCases) {
            console.info('Testing chargerType: ${testCase.name}');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isCharging: true,
                chargerType: testCase.value
            };
            try{
                workScheduler.startWork(workInfo);
                workScheduler.getWorkStatus(1).then((res) => {
                    console.info(`testStartWorkNEW032 getWorkStatus success for ${testCase.name}, data: ${JSON.stringify(res)}`);
                    expect(res.isCharging).assertEqual(true);
                    expect(res.chargerType).assertEqual(testCase.expected);
                })
                workScheduler.stopWork(workInfo)
            }catch(error){
                console.error(`testStartWorkNEW032 Test failed for ${testCase.name}: ${error.code}`);
                expect.fail(`testStartWorkNEW032 Test failed for ${testCase.name}: ${error.code}`);
            }
    }
    done();
    });

    /**
     * @tc.name   testStartWorkNEW033
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_033
     * @tc.desc   callback getWorkStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartWorkNEW033", Level.LEVEL0, async function (done) {
        console.info('----------------------testStartWorkNEW033---------------------------');
        workScheduler.stopAndClearWorks();
        let workInfo = {
            workId: 1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            isPersisted: false,
            networkType: workScheduler.NetworkType.NETWORK_TYPE_ANY,
            isCharging: true,
            chargerType: 0,
            batteryLevel: 20,
            batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_LOW,
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY,
            isRepeat: true,
            repeatCycleTime: 1200000,
            repeatCount: 2,
            isDeepIdle: true,
            idleWaitTime: 3000,
            parameters: {
                mykey0: 1,
                mykey1: "string value",
                mykey2: true,
                mykey3: 1.5
            },
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
        }catch(error){
            console.info("testStartWorkNEW033 start ----------------error: " + error.code);
        }
        try{
            expect(workScheduler.stopWork(workInfo)).assertNull();
            workScheduler.getWorkStatus(1, (err, res) => {
                console.info("testStartWorkNEW033 getWorkStatus callback success, data is:" +
                    JSON.stringify(res));
                    expect(res.workId).assertEqual(1);
                    expect(res.bundleName).assertEqual(ontouchstart.acts.resourceschedule.workScheduler.js.function);
                    expect(res.abilityName).assertEqual(com.mytest.abilityName);
                    expect(res.isPersisted).assertEqual(false);
                    expect(res.networkType).assertEqual(1);
                    expect(res.isCharging).assertEqual(true);
                    expect(res.batteryLevel).assertEqual(20);
                    expect(res.batteryStatus).assertEqual(1);
                    expect(res.storageRequest).assertEqual(1);
                    expect(res.isRepeat).assertEqual(true);
                    expect(res.repeatCycleTime).assertEqual(1200000);
                    expect(res.isDeepIdle).assertEqual(true);
                    expect(res.idleWaitTime).assertEqual(3000);
                    expect(res.parameters).toEqual({
                        mykey0: 1,
                        mykey1: "string value",
                        mykey2: true,
                        mykey3: 1.5
                    });
            });
            done();
        }catch(error){
            console.info("testStartWorkNEW033 stop----------------error: " + error.code);
        }
        })
    })
}
