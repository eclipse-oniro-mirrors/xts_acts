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
import workScheduler from '@ohos.resourceschedule.workScheduler'
import WorkSchedulerExtensionAbility from '@ohos.WorkSchedulerExtensionAbility'

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

export default function WorkSchedulerJsTest() {
describe("WorkSchedulerJsTest", function () {
    let workInfo = {
        workId: 0,
        bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
        abilityName: "com.mytest.abilityName"
    }

    function workStart(workInfo, callback) {
        workScheduler.startWork(workInfo);
        let WorkSchedulerExtensionContext = this.context;
        let result = null;
        try{
            WorkSchedulerExtensionAbility.onWorkStart(workInfo);
            result = true
        } catch(err) {
            result = err
        }
        callback(result)
    }

    function workStop(workInfo, callback) {
        workScheduler.stopWork(workInfo);
        let result = null;
        try{
            WorkSchedulerExtensionAbility.onWorkStop(workInfo);
            result = true
        } catch(err) {
            result = err
        }
        callback(result)
    }
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
     * @tc.name   WorkSchedulerJsTest001
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_001
     * @tc.desc   test work scheduler work id < 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest001", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest001---------------------------');
        let workInfo = {
            workId: -1,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName"
        }
        try{
            workScheduler.startWork(workInfo);
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
        }
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest002
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_002
     * @tc.desc   test work scheduler work id = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest002", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest002---------------------------');
        let workInfo = {
            workId: 0,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
        }
        try{
           expect(workScheduler.startWork(workInfo)).assertNull();
           done()
        }catch(err){
            console.info("----------------err: " + err.code)
        }
    })

    /**
     * @tc.name   WorkSchedulerJsTest003
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_003
     * @tc.desc   test work scheduler without bundle name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest003", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest003---------------------------');
        let workInfo = {
            workId: 3,
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })

    /**
     * @tc.name   WorkSchedulerJsTest004
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_004
     * @tc.desc   test work scheduler without ability name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest004", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest004---------------------------');
        let workInfo = {
            workId: 4,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })

    /**
     * @tc.name   WorkSchedulerJsTest005
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_005
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest005", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest005---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName"
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })

    /**
     * @tc.name   WorkSchedulerJsTest006
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_006
     * @tc.desc   test work scheduler success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest006", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest006---------------------------');
        let workInfo = {
            workId: 6,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
            done()
        }catch(err){
            console.info("----------------err: " + err.code);
        }
    })

    /**
     * @tc.name   WorkSchedulerJsTest007
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_007
     * @tc.desc   test stopWork.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest007", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest007---------------------------');
        let workInfo = {
            workId: 7,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
        }
        try {
            workScheduler.startWork(workInfo);
            workScheduler.stopWork(workInfo, 111);
            expect(workScheduler.stopWork(workInfo, 111)).assertNull();
            done();
        } catch ( err) {
            console.info("WorkSchedulerJsTest007 ---------------- err: " +  err.code);
        };
    })

    /**
     * @tc.name   WorkSchedulerJsTest008
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_008
     * @tc.desc   test stopWork.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest008", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest008---------------------------');
        let workInfo = {
            workId: 8,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
        }
        try{
            workScheduler.startWork(workInfo);
            expect(workScheduler.stopWork(workInfo, false)).assertNull();
            done()
        }catch(err){
            console.info("----------------err: " + err.code);
        }
    })

    /**
     * @tc.name   WorkSchedulerJsTest009
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_009
     * @tc.desc   test getWorkStatus callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest009", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest009---------------------------');
        let workInfo = {
            workId: 9,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
        }
        try {
            workScheduler.startWork(workInfo);
        } catch ( err) {
            expect( err.code).assertEqual("401")
        }
        workScheduler.getWorkStatus(9, (err, res) => {
            if (err) {
                expect(false).assertEqual(true)
            } else {
                for (let item in res) {
                    console.info('WorkSchedulerJsTest009 getWorkStatuscallback success,' + item + ' is:' + 
                    res[item]);
                }
                expect(true).assertEqual(true)
            }
        });
        setTimeout(()=>{
            done();
        }, 500);
    })

    /**
     * @tc.name   WorkSchedulerJsTest010
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0010
     * @tc.desc   test getWorkStatus promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest010", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest010---------------------------');
        let workInfo = {
            workId: 10,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY,
            batteryLevel: 15
        }
        try {
            workScheduler.startWork(workInfo)
        } catch ( err) {
            expect( err.code).assertEqual("401")
        }
        workScheduler.getWorkStatus(10).then((res) => {
            for (let item in res) {
                console.info('WorkSchedulerJsTest010 getWorkStatuscallback success,' + item + ' is:' + 
                res[item]);
            }
            expect(true).assertEqual(true)
        }).catch((err) => {
            expect(false).assertEqual(true)
        })

        setTimeout(()=>{
            done();
        }, 500);
    })

    /**
     * @tc.name   WorkSchedulerJsTest011
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0011
     * @tc.desc   test obtainAllWorks callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest011", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest011---------------------------');
        let workInfo = {
            workId: 11,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
        }
        try {
            workScheduler.startWork(workInfo);
        } catch ( err) {
            expect( err.code).assertEqual("401")
        }
        workScheduler.obtainAllWorks((err, res) =>{
            if (err) {
                expect(false).assertEqual(true)
            } else {
                console.info('WorkSchedulerJsTest011 obtainAllWorks callback success, data is:' + 
                JSON.stringify(res));
                expect(true).assertEqual(true)
            }
         });

        setTimeout(()=>{
            done();
        }, 500);
    })

    /**
     * @tc.name   WorkSchedulerJsTest012
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0012
     * @tc.desc   test obtainAllWorks promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest012", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest012---------------------------');
        let workInfo = {
            workId: 12,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY,
            batteryLevel: 15
        }
        try {
            workScheduler.startWork(workInfo)
        } catch ( err) {
            expect( err.code).assertEqual("401")
        }
        workScheduler.obtainAllWorks().then((res) => {
            console.info('WorkSchedulerJsTest012 obtainAllWorks promise success, data is:' + 
            JSON.stringify(res));
            expect(true).assertEqual(true)
        }).catch((err) => {
            console.info('WorkSchedulerJsTest012 obtainAllWorks promise failed, because:' + err.data);
            expect(false).assertEqual(true)
        })

        setTimeout(()=>{
            done();
        }, 500);
    })

    /**
     * @tc.name   WorkSchedulerJsTest013
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0013
     * @tc.desc   test stopAndClearWorks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest013", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest013---------------------------');
        let workInfo = {
            workId: 13,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
            storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
        }
        try{
            workScheduler.startWork(workInfo);
            workScheduler.stopWork(workInfo, false);
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
        }
        done()
    })

    /**
     * @tc.name   WorkSchedulerJsTest014
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0014
     * @tc.desc   test isLastWorkTimeOut callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest014", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest014---------------------------');
        workScheduler.isLastWorkTimeOut(14, (err, res) =>{
            if (err) {
                console.info('WorkSchedulerJsTest014 isLastWorkTimeOut callback failed, err:' + err.code);
                expect(err.code).assertEqual(9700004);
                done();
            } else {
                console.info('WorkSchedulerJsTest014 isLastWorkTimeOut callback success, data is:' + res);
            }
        });
    })

    /**
     * @tc.name   WorkSchedulerJsTest015
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0015
     * @tc.desc   test isLastWorkTimeOut promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest015", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest015---------------------------');
        workScheduler.isLastWorkTimeOut(15)
            .then(res => {
                console.info('WorkSchedulerJsTest015 isLastWorkTimeOut promise success, data is:' + res);
            })
            .catch(err =>  {
                console.info('WorkSchedulerJsTest015 isLastWorkTimeOut promise failed, err:' + err.code);
                expect(err.code).assertEqual(9700004);
                done();
        });
    })

    /**
     * @tc.name   WorkSchedulerJsTest016
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0016
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest016", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest016---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_ANY;
        expect(value1).assertEqual(0)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest017
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0017
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest017", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest017---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_MOBILE;
        expect(value1).assertEqual(1)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest018
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0018
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest018", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest018---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_WIFI;
        expect(value1).assertEqual(2)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest019
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0019
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest019", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest019---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_BLUETOOTH;
        expect(value1).assertEqual(3)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest020
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0020
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest020", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest020---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_WIFI_P2P;
        expect(value1).assertEqual(4)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest021
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0021
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest021", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest021---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_ETHERNET;
        expect(value1).assertEqual(5)
        done();
    })

   /**
    * @tc.name   WorkSchedulerJsTest022
    * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0022
    * @tc.desc   test work scheduler constant
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it("WorkSchedulerJsTest022", Level.LEVEL0, function (done) {
    console.info('----------------------WorkSchedulerJsTest022---------------------------');
    let value1 = workScheduler.ChargingType.CHARGING_PLUGGED_ANY;
    expect(value1).assertEqual(0)
    done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest023
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0023
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest023", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest023---------------------------');
        let value1 = workScheduler.ChargingType.CHARGING_PLUGGED_AC;
        expect(value1).assertEqual(1)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest024
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0024
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest024", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest024---------------------------');
        let value1 = workScheduler.ChargingType.CHARGING_PLUGGED_USB;
        expect(value1).assertEqual(2)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest025
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0025
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest025", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest025---------------------------');
        let value1 = workScheduler.ChargingType.CHARGING_PLUGGED_WIRELESS;
        expect(value1).assertEqual(3)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest026
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0026
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest026", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest026---------------------------');
        let value1 = workScheduler.BatteryStatus.BATTERY_STATUS_LOW;
        expect(value1).assertEqual(0)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest027
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0027
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest027", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest027---------------------------');
        let value1 = workScheduler.BatteryStatus.BATTERY_STATUS_OKAY;
        expect(value1).assertEqual(1)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest028
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0028
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest028", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest028---------------------------');
        let value1 = workScheduler.BatteryStatus.BATTERY_STATUS_LOW_OR_OKAY;
        expect(value1).assertEqual(2)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest029
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0029
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest029", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest029---------------------------');
        let value1 = workScheduler.StorageRequest.STORAGE_LEVEL_LOW;
        expect(value1).assertEqual(0)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest030
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0030
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest030", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest030---------------------------');
        let value1 = workScheduler.StorageRequest.STORAGE_LEVEL_OKAY;
        expect(value1).assertEqual(1)
        done();
    })

    /**
     * @tc.name   WorkSchedulerJsTest031
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0031
     * @tc.desc   test work scheduler constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest031", Level.LEVEL0, function (done) {
        console.info('----------------------WorkSchedulerJsTest031---------------------------');
        let value1 = workScheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY;
        expect(value1).assertEqual(2)
        done();
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest032
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0032
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest032", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest032---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isPersisted: true
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest033
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0033
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest033", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest033---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isPersisted: false
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest034
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0034
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest034", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest034---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isCharging: true
        }
        try{
            expect(workScheduler.startWork(workInfo)).assertNull();
            done()
        }catch(err){
            console.info("----------------err: " + err.code);
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest035
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0035
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest035", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest035---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isCharging: false
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest036
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0036
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest036", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest036---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: true
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest037
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0037
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest037", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest037---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: false
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest038
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0038
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest038", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest038---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isDeepIdle: true
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest039
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0039
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest039", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest039---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isDeepIdle: false
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest040
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0040
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest040", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest040---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			batteryLevel: 20
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest041
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0041
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest041", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest041---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			batteryLevel: 50
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest042
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0042
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest042", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest042---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			batteryLevel: 80
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest043
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0043
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest043", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest043---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: true,
			repeatCycleTime: 1800000,
			repeatCount: 2
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest044
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0044
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest044", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest044---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: false,
			repeatCycleTime: 2400000,
			repeatCount: 3
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest045
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0045
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest045", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest045---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			idleWaitTime: 3000,
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }  
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest046
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0046
     * @tc.desc   test workScheduler workInfo networkType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest046", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest046---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			networkType: workScheduler.NetworkType.NETWORK_TYPE_ANY
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest047
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0047
     * @tc.desc   test workScheduler workInfo ChargingType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest047", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest047---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			chargerType: workScheduler.ChargingType.CHARGING_PLUGGED_AC
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest048
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0048
     * @tc.desc   test workScheduler workInfo BatteryStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest048", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest048---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_LOW
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name     WorkSchedulerJsTest051
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0051
     * @tc.desc   test workScheduler bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("  WorkSchedulerJsTest051", Level.LEVEL0, async function (done) {
        console.info('----------------------  WorkSchedulerJsTest051---------------------------');
        let workInfo = {
            workId: 4,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest052
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0052
     * @tc.desc   test workScheduler workInfo abilityName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest052", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest052---------------------------');
        let workInfo = {
            workId: 8,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest053
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0053
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest053", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest053---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			batteryLevel: 10
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest054
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0054
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest054", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest054---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			batteryLevel: 30
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest055
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0055
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest055", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest055---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			batteryLevel: 40
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest056
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0056
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest056", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest056---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			batteryLevel: 60
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest057
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0057
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest057", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest057---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			batteryLevel: 70
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest058
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0058
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest058", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest058---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			batteryLevel: 90
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest059
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0059
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest059", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest059---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			batteryLevel: 100
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest060
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0060
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest060", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest060---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: true,
			repeatCycleTime: 1200000
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest061
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0061
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest061", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest061---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: true,
			repeatCycleTime: 1500000
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest062
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0062
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest062", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest062---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: true,
			repeatCycleTime: 1800000
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest063
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0063
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest063", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest063---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: true,
			repeatCycleTime: 2100000
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest064
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0064
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest064", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest064---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: false,
			repeatCycleTime: 1200000
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest065
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0065
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest065", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest065---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: false,
			repeatCycleTime: 1500000
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest066
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0066
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest066", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest066---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: false,
			repeatCycleTime: 1800000
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest067
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0067
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest067", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest067---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			isRepeat: false,
			repeatCycleTime: 2100000
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest068
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0068
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest068", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest068---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			repeatCycleTime: 1200000,
			repeatCount: 1
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
    /**
     * @tc.name   WorkSchedulerJsTest069
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0069
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest069", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest069---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			repeatCycleTime: 1500000,
			repeatCount: 1
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest070
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0070
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest070", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest070---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			repeatCycleTime: 1800000,
			repeatCount: 2
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
	
    /**
     * @tc.name   WorkSchedulerJsTest071
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0071
     * @tc.desc   test work scheduler without conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("WorkSchedulerJsTest071", Level.LEVEL0, async function (done) {
        console.info('----------------------WorkSchedulerJsTest071---------------------------');
        let workInfo = {
            workId: 5,
            bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
            abilityName: "com.mytest.abilityName",
			repeatCycleTime: 2100000,
			repeatCount: 2
        }
        try{
            workScheduler.startWork(workInfo)
        }catch(err){
            console.info("----------------err: " + err.code);
            expect(err.code).assertEqual("9700005");
            done();
        }
    })
})}