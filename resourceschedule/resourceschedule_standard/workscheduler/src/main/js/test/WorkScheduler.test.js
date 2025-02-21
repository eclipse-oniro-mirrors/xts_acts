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
import workScheduler from '@ohos.resourceschedule.workScheduler'
import WorkSchedulerExtensionAbility from '@ohos.WorkSchedulerExtensionAbility'

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function WorkSchedulerJsTest() {
describe("WorkSchedulerJsTest", function () {
    let workInfo = {
        workId: 0,
        bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
        abilityName: "com.mytest.abilityName"
    }

    function workStart(workInfo, callback) {
        let result = null
        try{
            WorkSchedulerExtensionAbility.onWorkStart(workInfo)
            result = true
        } catch(err) {
            result = err
        }
        callback(result)
    }

    function workStop(workInfo, callback) {
        let result = null
        try{
            WorkSchedulerExtensionAbility.onWorkStop(workInfo)
            result = true
        } catch(err) {
            result = err
        }
        callback(result)
    }
    beforeAll(function() {

        workStart(workInfo,function(data) {
            let WorkSchedulerExtensionContext = this.context;
            console.info("onWorkStart finish,result: " + data)
        })
        /*
         * @tc.setup: setup invoked before all testcases
         */
         console.info('beforeAll caled')
    })

    afterAll(function() {
        
        workStop(workInfo, function(data) {
            console.info("onWorkStop finish,result: " + data)
        })
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_001
     * @tc.name: WorkSchedulerJsTest001
     * @tc.desc: test work scheduler work id < 0
     */
    it("WorkSchedulerJsTest001", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_002
     * @tc.name: WorkSchedulerJsTest002
     * @tc.desc: test work scheduler work id = 0
     */
    it("WorkSchedulerJsTest002", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_003
     * @tc.name: WorkSchedulerJsTest003
     * @tc.desc: test work scheduler without bundle name.
     */
    it("WorkSchedulerJsTest003", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_004
     * @tc.name: WorkSchedulerJsTest004
     * @tc.desc: test work scheduler without ability name.
     */
    it("WorkSchedulerJsTest004", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_005
     * @tc.name: WorkSchedulerJsTest005
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest005", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_006
     * @tc.name: WorkSchedulerJsTest006
     * @tc.desc: test work scheduler success.
     */
    it("WorkSchedulerJsTest006", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_007
     * @tc.name: WorkSchedulerJsTest007
     * @tc.desc: test stopWork.
     */
    it("WorkSchedulerJsTest007", 0, async function (done) {
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
        } catch ( err) {
            console.info("---------------- err: " +  err.code);
            expect( err.code).assertEqual("401");
            done();
        };
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_008
     * @tc.name: WorkSchedulerJsTest008
     * @tc.desc: test stopWork.
     */
    it("WorkSchedulerJsTest008", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_009
     * @tc.name: WorkSchedulerJsTest009
     * @tc.desc: test getWorkStatus callback.
     */
    it("WorkSchedulerJsTest009", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0010
     * @tc.name: WorkSchedulerJsTest010
     * @tc.desc: test getWorkStatus promise.
     */
    it("WorkSchedulerJsTest010", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0011
     * @tc.name: WorkSchedulerJsTest011
     * @tc.desc: test obtainAllWorks callback.
     */
    it("WorkSchedulerJsTest011", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0012
     * @tc.name: WorkSchedulerJsTest012
     * @tc.desc: test obtainAllWorks promise.
     */
    it("WorkSchedulerJsTest012", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0013
     * @tc.name: WorkSchedulerJsTest013
     * @tc.desc: test stopAndClearWorks.
     */
    it("WorkSchedulerJsTest013", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0014
     * @tc.name: WorkSchedulerJsTest014
     * @tc.desc: test isLastWorkTimeOut callback.
     */
    it("WorkSchedulerJsTest014", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0015
     * @tc.name: WorkSchedulerJsTest015
     * @tc.desc: test isLastWorkTimeOut promise.
     */
    it("WorkSchedulerJsTest015", 0, async function (done) {
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

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0016
     * @tc.name: WorkSchedulerJsTest016
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest016", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest016---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_ANY;
        expect(value1).assertEqual(0)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0017
     * @tc.name: WorkSchedulerJsTest017
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest017", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest017---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_MOBILE;
        expect(value1).assertEqual(1)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0018
     * @tc.name: WorkSchedulerJsTest018
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest018", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest018---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_WIFI;
        expect(value1).assertEqual(2)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0019
     * @tc.name: WorkSchedulerJsTest019
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest019", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest019---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_BLUETOOTH;
        expect(value1).assertEqual(3)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0020
     * @tc.name: WorkSchedulerJsTest020
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest020", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest020---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_WIFI_P2P;
        expect(value1).assertEqual(4)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0021
     * @tc.name: WorkSchedulerJsTest021
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest021", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest021---------------------------');
        let value1 = workScheduler.NetworkType.NETWORK_TYPE_ETHERNET;
        expect(value1).assertEqual(5)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0022
     * @tc.name: WorkSchedulerJsTest022
     * @tc.desc: test work scheduler constant
     */
   it("WorkSchedulerJsTest022", 0, function (done) {
    console.info('----------------------WorkSchedulerJsTest022---------------------------');
    let value1 = workScheduler.ChargingType.CHARGING_PLUGGED_ANY;
    expect(value1).assertEqual(0)
    done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0023
     * @tc.name: WorkSchedulerJsTest023
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest023", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest023---------------------------');
        let value1 = workScheduler.ChargingType.CHARGING_PLUGGED_AC;
        expect(value1).assertEqual(1)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0024
     * @tc.name: WorkSchedulerJsTest024
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest024", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest024---------------------------');
        let value1 = workScheduler.ChargingType.CHARGING_PLUGGED_USB;
        expect(value1).assertEqual(2)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0025
     * @tc.name: WorkSchedulerJsTest025
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest025", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest025---------------------------');
        let value1 = workScheduler.ChargingType.CHARGING_PLUGGED_WIRELESS;
        expect(value1).assertEqual(3)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0026
     * @tc.name: WorkSchedulerJsTest026
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest026", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest026---------------------------');
        let value1 = workScheduler.BatteryStatus.BATTERY_STATUS_LOW;
        expect(value1).assertEqual(0)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0027
     * @tc.name: WorkSchedulerJsTest027
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest027", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest027---------------------------');
        let value1 = workScheduler.BatteryStatus.BATTERY_STATUS_OKAY;
        expect(value1).assertEqual(1)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0028
     * @tc.name: WorkSchedulerJsTest028
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest028", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest028---------------------------');
        let value1 = workScheduler.BatteryStatus.BATTERY_STATUS_LOW_OR_OKAY;
        expect(value1).assertEqual(2)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0029
     * @tc.name: WorkSchedulerJsTest029
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest029", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest029---------------------------');
        let value1 = workScheduler.StorageRequest.STORAGE_LEVEL_LOW;
        expect(value1).assertEqual(0)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0030
     * @tc.name: WorkSchedulerJsTest030
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest030", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest030---------------------------');
        let value1 = workScheduler.StorageRequest.STORAGE_LEVEL_OKAY;
        expect(value1).assertEqual(1)
        done();
    })

    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0031
     * @tc.name: WorkSchedulerJsTest031
     * @tc.desc: test work scheduler constant
     */
    it("WorkSchedulerJsTest031", 0, function (done) {
        console.info('----------------------WorkSchedulerJsTest031---------------------------');
        let value1 = workScheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY;
        expect(value1).assertEqual(2)
        done();
    })
	
    /*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0032
     * @tc.name: WorkSchedulerJsTest032
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest032", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0033
     * @tc.name: WorkSchedulerJsTest033
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest033", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0034
     * @tc.name: WorkSchedulerJsTest034
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest034", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0035
     * @tc.name: WorkSchedulerJsTest035
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest035", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0036
     * @tc.name: WorkSchedulerJsTest036
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest036", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0037
     * @tc.name: WorkSchedulerJsTest037
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest037", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0038
     * @tc.name: WorkSchedulerJsTest038
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest038", 0, async function (done) {
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
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0039
     * @tc.name: WorkSchedulerJsTest039
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest039", 0, async function (done) {
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
            expect(err.code).assertEqual("401");
            done();
        }
    })
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0040
     * @tc.name: WorkSchedulerJsTest040
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest040", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0041
     * @tc.name: WorkSchedulerJsTest041
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest041", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0042
     * @tc.name: WorkSchedulerJsTest042
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest042", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0043
     * @tc.name: WorkSchedulerJsTest043
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest043", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0044
     * @tc.name: WorkSchedulerJsTest044
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest044", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0045
     * @tc.name: WorkSchedulerJsTest045
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest045", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0046
     * @tc.name: WorkSchedulerJsTest046
     * @tc.desc: test workScheduler workInfo networkType
     */
    it("WorkSchedulerJsTest046", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0047
     * @tc.name: WorkSchedulerJsTest047
     * @tc.desc: test workScheduler workInfo ChargingType
     */
    it("WorkSchedulerJsTest047", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0048
     * @tc.name: WorkSchedulerJsTest048
     * @tc.desc: test workScheduler workInfo BatteryStatus
     */
    it("WorkSchedulerJsTest048", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0051
     * @tc.name:  WorkSchedulerJsTest051
     * @tc.desc: test workScheduler bundleName
 
     */
    it("  WorkSchedulerJsTest051", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0052
     * @tc.name: WorkSchedulerJsTest052
     * @tc.desc: test workScheduler workInfo abilityName
     */
    it("WorkSchedulerJsTest052", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0053
     * @tc.name: WorkSchedulerJsTest053
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest053", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0054
     * @tc.name: WorkSchedulerJsTest054
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest054", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0055
     * @tc.name: WorkSchedulerJsTest055
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest055", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0056
     * @tc.name: WorkSchedulerJsTest056
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest056", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0057
     * @tc.name: WorkSchedulerJsTest057
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest057", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0058
     * @tc.name: WorkSchedulerJsTest058
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest058", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0059
     * @tc.name: WorkSchedulerJsTest059
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest059", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0060
     * @tc.name: WorkSchedulerJsTest060
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest060", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0061
     * @tc.name: WorkSchedulerJsTest061
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest061", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0062
     * @tc.name: WorkSchedulerJsTest062
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest062", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0063
     * @tc.name: WorkSchedulerJsTest063
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest063", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0064
     * @tc.name: WorkSchedulerJsTest064
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest064", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0065
     * @tc.name: WorkSchedulerJsTest065
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest065", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0066
     * @tc.name: WorkSchedulerJsTest066
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest066", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0067
     * @tc.name: WorkSchedulerJsTest067
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest067", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0068
     * @tc.name: WorkSchedulerJsTest068
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest068", 0, async function (done) {
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
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0069
     * @tc.name: WorkSchedulerJsTest069
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest069", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0070
     * @tc.name: WorkSchedulerJsTest070
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest070", 0, async function (done) {
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
	
	/*
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0071
     * @tc.name: WorkSchedulerJsTest071
     * @tc.desc: test work scheduler without conditions.
     */
    it("WorkSchedulerJsTest071", 0, async function (done) {
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