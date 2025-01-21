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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function WorkSchedulerMgrApiTest() {
    describe("WorkSchedulerMgrApiTest", function () {
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
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_072
         * @tc.name      testStartWorkFun001
         * @tc.desc      test workScheduler workInfo networkType is MOBILE.
         */
        it("testStartWorkFun001", 0, async function (done) {
            console.info('----------------------testStartWorkFun001---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: workScheduler.NetworkType.NETWORK_TYPE_MOBILE
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_073
         * @tc.name      testStartWorkFun002
         * @tc.desc      test workScheduler workInfo networkType is WIFI.
         */
        it("testStartWorkFun002", 0, async function (done) {
            console.info('----------------------testStartWorkFun002---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: workScheduler.NetworkType.NETWORK_TYPE_WIFI
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_074
         * @tc.name      testStartWorkFun003
         * @tc.desc      test workScheduler workInfo networkType is BLUETOOTH.
         */
        it("testStartWorkFun003", 0, async function (done) {
            console.info('----------------------testStartWorkFun003---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: workScheduler.NetworkType.NETWORK_TYPE_BLUETOOTH
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_075
         * @tc.name      testStartWorkFun004
         * @tc.desc      test workScheduler workInfo networkType is WIFI_P2P.
         */
        it("testStartWorkFun004", 0, async function (done) {
            console.info('----------------------testStartWorkFun004---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: workScheduler.NetworkType.NETWORK_TYPE_WIFI_P2P
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_076
         * @tc.name      testStartWorkFun005
         * @tc.desc      test workScheduler workInfo networkType is ETHERNET.
         */
        it("testStartWorkFun005", 0, async function (done) {
            console.info('----------------------testStartWorkFun005---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: workScheduler.NetworkType.NETWORK_TYPE_ETHERNET
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_077
         * @tc.name      testStartWorkFun006
         * @tc.desc      test workScheduler workInfo chargerType is ANY.
         */
        it("testStartWorkFun006", 0, async function (done) {
            console.info('----------------------testStartWorkFun006---------------------------');
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
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_078
         * @tc.name      testStartWorkFun007
         * @tc.desc      test workScheduler workInfo chargerType is USB.
         */
        it("testStartWorkFun007", 0, async function (done) {
            console.info('----------------------testStartWorkFun007---------------------------');
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
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_079
         * @tc.name      testStartWorkFun008
         * @tc.desc      test workScheduler workInfo chargerType is WIRELESS.
         */
        it("testStartWorkFun008", 0, async function (done) {
            console.info('----------------------testStartWorkFun008---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isCharging: false,
                chargerType: workScheduler.ChargingType.CHARGING_PLUGGED_WIRELESS
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_080
         * @tc.name      testStartWorkFun009
         * @tc.desc      test workScheduler workInfo BatteryStatus OKAY.
         */
        it("testStartWorkFun009", 0, async function (done) {
            console.info('----------------------testStartWorkFun009---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_OKAY
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_081
         * @tc.name      testStartWorkFun010
         * @tc.desc      test workScheduler workInfo BatteryStatus LOW_OR_OKAY.
         */
        it("testStartWorkFun010", 0, async function (done) {
            console.info('----------------------testStartWorkFun010---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_LOW_OR_OKAY
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_082
         * @tc.name      testStartWorkFun011
         * @tc.desc      test workScheduler workInfo storageRequest LOW.
         */
        it("testStartWorkFun011", 0, async function (done) {
            console.info('----------------------testStartWorkFun011---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_LOW
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_083
         * @tc.name      testStartWorkFun012
         * @tc.desc      test workScheduler workInfo storageRequest OKAY.
         */
        it("testStartWorkFun012", 0, async function (done) {
            console.info('----------------------testStartWorkFun012---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_084
         * @tc.name      testStartWorkFun013
         * @tc.desc      test workScheduler workInfo storageRequest LOW_OR_OKAY.
         */
        it("testStartWorkFun013", 0, async function (done) {
            console.info('----------------------testStartWorkFun013---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_085
         * @tc.name      testStartWorkFun014
         * @tc.desc      test workScheduler workInfo select all parameter.
         */
        it("testStartWorkFun014", 0, async function (done) {
            console.info('----------------------testStartWorkFun014---------------------------');
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
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_086
         * @tc.name      testStartWorkFun015
         * @tc.desc      test workScheduler workInfo select networkType,batteryLevel,batteryStatus,storageRequest.
         */
        it("testStartWorkFun015", 0, async function (done) {
            console.info('----------------------testStartWorkFun015---------------------------');
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
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_087
         * @tc.name      testStartWorkFun016
         * @tc.desc      test start workScheduler workId is StringType. 
         */
        it("testStartWorkFun016", 0, async function (done) {
            console.info('----------------------testStartWorkFun016---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: "1",
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_088
         * @tc.name      testStartWorkFun017
         * @tc.desc      test start workScheduler workId is NullType. 
         */
        it("testStartWorkFun017", 0, async function (done) {
            console.info('----------------------testStartWorkFun017---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: null,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_089
         * @tc.name      testStartWorkFun018
         * @tc.desc      test start workScheduler without workId. 
         */
        it("testStartWorkFun018", 0, async function (done) {
            console.info('----------------------testStartWorkFun018---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_090
         * @tc.name      testStartWorkFun019
         * @tc.desc      test start workScheduler bundleName is NumberType. 
         */
        it("testStartWorkFun019", 0, async function (done) {
            console.info('----------------------testStartWorkFun019---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: 123,
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_091
         * @tc.name      testStartWorkFun020
         * @tc.desc      test start workScheduler bundleName error. 
         */
        it("testStartWorkFun020", 0, async function (done) {
            console.info('----------------------testStartWorkFun020---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workschedulers.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("9700004");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_092
         * @tc.name      testStartWorkFun021
         * @tc.desc      test start workScheduler bundleName is NullType. 
         */
        it("testStartWorkFun021", 0, async function (done) {
            console.info('----------------------testStartWorkFun021---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: null,
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_093
         * @tc.name      testStartWorkFun022
         * @tc.desc      test start workScheduler abilityName is NumberType. 
         */
        it("testStartWorkFun022", 0, async function (done) {
            console.info('----------------------testStartWorkFun022---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: 123,
                networkType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_094
         * @tc.name      testStartWorkFun023
         * @tc.desc      test start workScheduler abilityName is EmptyString. 
         */
        it("testStartWorkFun023", 0, async function (done) {
            console.info('----------------------testStartWorkFun023---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "",
                networkType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_095
         * @tc.name      testStartWorkFun024
         * @tc.desc      test start workScheduler abilityName is a space. 
         */
        it("testStartWorkFun024", 0, async function (done) {
            console.info('----------------------testStartWorkFun024---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: " ",
                networkType: 0
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_096
         * @tc.name      testStartWorkFun025
         * @tc.desc      test start workScheduler abilityName is NullType. 
         */
        it("testStartWorkFun025", 0, async function (done) {
            console.info('----------------------testStartWorkFun025---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: null,
                networkType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_097
         * @tc.name      testStartWorkFun026
         * @tc.desc      test start workScheduler networkType < 0. 
         */
        it("testStartWorkFun026", 0, async function (done) {
            console.info('----------------------testStartWorkFun026---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: -1
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_098
         * @tc.name      testStartWorkFun027
         * @tc.desc      test start workScheduler networkType > 5. 
         */
        it("testStartWorkFun027", 0, async function (done) {
            console.info('----------------------testStartWorkFun027---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 6
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_099
         * @tc.name      testStartWorkFun028
         * @tc.desc      test start workScheduler chargerType < 0. 
         */
        it("testStartWorkFun028", 0, async function (done) {
            console.info('----------------------testStartWorkFun028---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isCharging: true,
                chargerType: -1
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_100
         * @tc.name      testStartWorkFun029
         * @tc.desc      test start workScheduler chargerType > 3. 
         */
        it("testStartWorkFun029", 0, async function (done) {
            console.info('----------------------testStartWorkFun029---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isCharging: false,
                chargerType: 4
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_101
         * @tc.name      testStartWorkFun030
         * @tc.desc      test start workScheduler isCharging is NumberType. 
         */
        it("testStartWorkFun030", 0, async function (done) {
            console.info('----------------------testStartWorkFun030---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isCharging: 1,
                chargerType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_102
         * @tc.name      testStartWorkFun031
         * @tc.desc      test start workScheduler isCharging is StringType. 
         */
        it("testStartWorkFun031", 0, async function (done) {
            console.info('----------------------testStartWorkFun031---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isCharging: "true",
                chargerType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_103
         * @tc.name      testStartWorkFun032
         * @tc.desc      test start workScheduler without isCharging. 
         */
        it("testStartWorkFun032", 0, async function (done) {
            console.info('----------------------testStartWorkFun032---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                chargerType: 0
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_104
         * @tc.name      testStartWorkFun033
         * @tc.desc      test start workScheduler batteryLevel < 0. 
         */
        it("testStartWorkFun033", 0, async function (done) {
            console.info('----------------------testStartWorkFun033---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                batteryLevel: -1
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_105
         * @tc.name      testStartWorkFun034
         * @tc.desc      test start workScheduler batteryLevel = 0. 
         */
        it("testStartWorkFun034", 0, async function (done) {
            console.info('----------------------testStartWorkFun034---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                batteryLevel: 0
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_106
         * @tc.name      testStartWorkFun035
         * @tc.desc      test start workScheduler batteryLevel = 100. 
         */
        it("testStartWorkFun035", 0, async function (done) {
            console.info('----------------------testStartWorkFun035---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                batteryLevel: 100
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_107
         * @tc.name      testStartWorkFun036
         * @tc.desc      test start workScheduler batteryLevel > 100. 
         */
        it("testStartWorkFun036", 0, async function (done) {
            console.info('----------------------testStartWorkFun036---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                batteryLevel: 101
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_108
         * @tc.name      testStartWorkFun037
         * @tc.desc      test start workScheduler batteryStatus < 0. 
         */
        it("testStartWorkFun037", 0, async function (done) {
            console.info('----------------------testStartWorkFun037---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                batteryStatus: -1
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_109
         * @tc.name      testStartWorkFun038
         * @tc.desc      test start workScheduler batteryStatus > 2. 
         */
        it("testStartWorkFun038", 0, async function (done) {
            console.info('----------------------testStartWorkFun038---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                batteryStatus: 3
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_110
         * @tc.name      testStartWorkFun039
         * @tc.desc      test start workScheduler storageRequest < 0. 
         */
        it("testStartWorkFun039", 0, async function (done) {
            console.info('----------------------testStartWorkFun039---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: -1
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_111
         * @tc.name      testStartWorkFun040
         * @tc.desc      test start workScheduler storageRequest > 2. 
         */
        it("testStartWorkFun040", 0, async function (done) {
            console.info('----------------------testStartWorkFun040---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: 3
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_112
         * @tc.name      testStartWorkFun041
         * @tc.desc      test start workScheduler repeatCycleTime < 0. 
         */
        it("testStartWorkFun041", 0, async function (done) {
            console.info('----------------------testStartWorkFun041---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isRepeat: true,
                repeatCycleTime: -1
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_113
         * @tc.name      testStartWorkFun042
         * @tc.desc      test start workScheduler repeatCycleTime < 20min. 
         */
        it("testStartWorkFun042", 0, async function (done) {
            console.info('----------------------testStartWorkFun042---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isRepeat: true,
                repeatCycleTime: 1140000
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("9700005");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_114
         * @tc.name      testStartWorkFun043
         * @tc.desc      test start workScheduler condition only repeatCycleTime. 
         */
        it("testStartWorkFun043", 0, async function (done) {
            console.info('----------------------testStartWorkFun043---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                repeatCycleTime: 1200000
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_115
         * @tc.name      testStartWorkFun044
         * @tc.desc      test start workScheduler without repeatCycleTime. 
         */
        it("testStartWorkFun044", 0, async function (done) {
            console.info('----------------------testStartWorkFun044---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isRepeat: true,
                repeatCount: 1
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_116
         * @tc.name      testStartWorkFun045
         * @tc.desc      test start workScheduler isRepeat is StringType. 
         */
        it("testStartWorkFun045", 0, async function (done) {
            console.info('----------------------testStartWorkFun045---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isRepeat: "false",
                repeatCycleTime: 1200000
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_117
         * @tc.name      testStartWorkFun046
         * @tc.desc      test start workScheduler repeatCount = 0. 
         */
        it("testStartWorkFun046", 0, async function (done) {
            console.info('----------------------testStartWorkFun046---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                repeatCycleTime: 1200000,
                repeatCount: 0
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_118
         * @tc.name      testStartWorkFun047
         * @tc.desc      test start workScheduler repeatCount < 0. 
         */
        it("testStartWorkFun047", 0, async function (done) {
            console.info('----------------------testStartWorkFun047---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                repeatCycleTime: 1200000,
                repeatCount: -1
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_119
         * @tc.name      testStartWorkFun048
         * @tc.desc      test start workScheduler isRepeat = false and repeatCount < 0. 
         */
        it("testStartWorkFun048", 0, async function (done) {
            console.info('----------------------testStartWorkFun048---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isRepeat: false,
                repeatCycleTime: 1200000,
                repeatCount: -1
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_120
         * @tc.name      testStartWorkFun049
         * @tc.desc      test start workScheduler condition only repeatCount. 
         */
        it("testStartWorkFun049", 0, async function (done) {
            console.info('----------------------testStartWorkFun049---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                repeatCount: 2
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_121
         * @tc.name      testStartWorkFun050
         * @tc.desc      test start workScheduler isPersisted is StringType. 
         */
        it("testStartWorkFun050", 0, async function (done) {
            console.info('----------------------testStartWorkFun050---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isPersisted: "true"
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_122
         * @tc.name      testStartWorkFun051
         * @tc.desc      test start workScheduler isPersisted is NumberType. 
         */
        it("testStartWorkFun051", 0, async function (done) {
            console.info('----------------------testStartWorkFun051---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isPersisted: 1
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_123
         * @tc.name      testStartWorkFun052
         * @tc.desc      test start workScheduler isDeepIdle is StringType. 
         */
        it("testStartWorkFun052", 0, async function (done) {
            console.info('----------------------testStartWorkFun052---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isDeepIdle: "false"
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_124
         * @tc.name      testStartWorkFun053
         * @tc.desc      test start workScheduler isDeepIdle is NumberType. 
         */
        it("testStartWorkFun053", 0, async function (done) {
            console.info('----------------------testStartWorkFun053---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isDeepIdle: 1
            }
            try{
                workScheduler.startWork(workInfo);
            }catch(error){
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_125
         * @tc.name      testStopWorkFun001
         * @tc.desc      test stop workScheduler needCancel is StringType. 
         */
        it("testStopWorkFun001", 0, async function (done) {
            console.info('----------------------testStopWorkFun001---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try {
                workScheduler.startWork(workInfo);
                workScheduler.stopWork(workInfo, "true");
                expect(workScheduler.stopWork(workInfo, "true")).assertNull();
                done();
            } catch (error) {
                console.info("testStopWorkFun001 ----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_126
         * @tc.name      testStopWorkFun002
         * @tc.desc      test stop workScheduler needCancel is NumberType. 
         */
        it("testStopWorkFun002", 0, async function (done) {
            console.info('----------------------testStopWorkFun002---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            };
            try {
                workScheduler.startWork(workInfo);
                workScheduler.stopWork(workInfo, undefined);
                expect(workScheduler.stopWork(workInfo, undefined)).assertNull();
                done();
            } catch (error) {
                console.info("testStopWorkFun002 ----------------error: " + error.code);
            };
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_127
         * @tc.name      testStopWorkFun003
         * @tc.desc      test stop workScheduler needCancel is NullType. 
         */
        it("testStopWorkFun003", 0, async function (done) {
            console.info('----------------------testStopWorkFun003---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try {
                workScheduler.startWork(workInfo);
                workScheduler.stopWork(workInfo, null);
                expect(workScheduler.stopWork(workInfo, null)).assertNull();
                done();
            } catch (error) {
                console.info("testStopWorkFun003 ----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_128
         * @tc.name      testStopWorkFun004
         * @tc.desc      test stop workScheduler missing parameter needCancel. 
         */
        it("testStopWorkFun004", 0, async function (done) {
            console.info('----------------------testStopWorkFun004---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try {
                workScheduler.startWork(workInfo);
                workScheduler.stopWork(workInfo);
                expect(workScheduler.stopWork(workInfo)).assertNull();
                done();
            } catch (error) {
                console.info("testStopWorkFun004 ----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_129
         * @tc.name      testStopWorkFun005
         * @tc.desc      test stop workScheduler workId error ,needCancel true. 
         */
        it("testStopWorkFun005", 0, async function (done) {
            console.info('----------------------testStopWorkFun005---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            let workInfo2 = {
                workId: 2,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try {
                workScheduler.startWork(workInfo1);
                workScheduler.stopWork(workInfo2, true)
            } catch (error) {
                console.info("----------------error: " + error.code)
                expect(error.code).assertEqual("9700004");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_130
         * @tc.name      testStopWorkFun006
         * @tc.desc      test stop workScheduler workId error ,needCancel false. 
         */
        it("testStopWorkFun006", 0, async function (done) {
            console.info('----------------------testStopWorkFun006---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            let workInfo2 = {
                workId: 2,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try {
                workScheduler.startWork(workInfo1);
                workScheduler.stopWork(workInfo2, false)
            } catch (error) {
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("9700004");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_131
         * @tc.name      testStopWorkFun007
         * @tc.desc      test stop workScheduler bundleName error,needCancel true. 
         */
        it("testStopWorkFun007", 0, async function (done) {
            console.info('----------------------testStopWorkFun007---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            let workInfo2 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try {
                workScheduler.startWork(workInfo1);
                workScheduler.stopWork(workInfo2, true)
            } catch (error) {
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("9700004");
                done()
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_132
         * @tc.name      testStopWorkFun008
         * @tc.desc      test stop workScheduler bundleName error,needCancel false. 
         */
        it("testStopWorkFun008", 0, async function (done) {
            console.info('----------------------testStopWorkFun008---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            let workInfo2 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            try {
                workScheduler.startWork(workInfo1);
                workScheduler.stopWork(workInfo2, false)
            } catch (error) {
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("9700004");
                done();
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_133
         * @tc.name      testStopWorkFun009
         * @tc.desc      test stop workScheduler abilityName error,needCancel true. 
         */
        it("testStopWorkFun009", 0, async function (done) {
            console.info('----------------------testStopWorkFun009---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0
            }
            let workInfo2 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.bundleName",
                networkType: 0
            }
            try {
                workScheduler.startWork(workInfo1);
                expect(workScheduler.stopWork(workInfo2, true)).assertNull();
                done()
            } catch (error) {
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_134
         * @tc.name      testStopWorkFun010
         * @tc.desc      test stop workScheduler abilityName error,needCancel false. 
         */
        it("testStopWorkFun010", 0, async function (done) {
            console.info('----------------------testStopWorkFun010---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 2
            }
            let workInfo2 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.bundleName",
                networkType: 2
            }
            try {
                workScheduler.startWork(workInfo1);
                expect(workScheduler.stopWork(workInfo2, false)).assertNull();
                done()
            } catch (error) {
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_135
         * @tc.name      testStopWorkFun011
         * @tc.desc      test stop workScheduler networkType different. 
         */
        it("testStopWorkFun011", 0, async function (done) {
            console.info('----------------------testStopWorkFun011---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 1
            }
            let workInfo2 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 2
            }
            try {
                workScheduler.startWork(workInfo1);
                expect(workScheduler.stopWork(workInfo2, true)).assertNull();
                done()
            } catch (error) {
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_136
         * @tc.name      testStopWorkFun012
         * @tc.desc      test stop workScheduler chargerType different. 
         */
        it("testStopWorkFun012", 0, async function (done) {
            console.info('----------------------testStopWorkFun012---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isCharging: true,
                chargerType: 0
            }
            let workInfo2 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isCharging: true,
                chargerType: 1
            }
            try {
                workScheduler.startWork(workInfo1);
                expect(workScheduler.stopWork(workInfo2, true)).assertNull();
                done()
            } catch (error) {
                console.info("----------------error: " + error.code);
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_137
         * @tc.name      test stopWorkFun013
         * @tc.desc      test stop workScheduler batteryStatus different. 
         */
        it("testStopWorkFun013", 0, async function (done) {
            console.info('----------------------testStopWorkFun013---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                batteryStatus: 0
            }
            let workInfo2 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                batteryStatus: 1
            }
            try {
                workScheduler.startWork(workInfo1);
                expect(workScheduler.stopWork(workInfo2, false)).assertNull();
                done()
            } catch (error) {
                console.info("----------------error: " + error.code)
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_138
         * @tc.name      test stopWorkFun014
         * @tc.desc      test stop workScheduler storageRequest different. 
         */
        it("testStopWorkFun014", 0, async function (done) {
            console.info('----------------------testStopWorkFun014---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: 0
            }
            let workInfo2 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: 1
            }
            try {
                workScheduler.startWork(workInfo1);
                expect(workScheduler.stopWork(workInfo2, false)).assertNull();
                done()
            } catch (error) {
                console.info("----------------error: " + error.code)
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_139
         * @tc.name      testStopWorkFun015
         * @tc.desc      test stop workScheduler isPersisted different. 
         */
        it("testStopWorkFun015", 0, async function (done) {
            console.info('----------------------testStopWorkFun015---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0,
                isPersisted: true
            }
            let workInfo2 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0,
                isPersisted: false
            }
            try {
                workScheduler.startWork(workInfo1);
                expect(workScheduler.stopWork(workInfo2, false)).assertNull();
                done()
            } catch (error) {
                console.info("----------------error: " + error.code)
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_140
         * @tc.name      testStopWorkFun016
         * @tc.desc      test stop workScheduler repeatCycleTime different. 
         */
        it("testStopWorkFun016", 0, async function (done) {
            console.info('----------------------testStopWorkFun016---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo1 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isRepeat: true,
                repeatCycleTime: 1200000
            }
            let workInfo2 = {
                workId: 1,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                isRepeat: true,
                repeatCycleTime: 1500000
            }
            try {
                workScheduler.startWork(workInfo1);
                expect(workScheduler.stopWork(workInfo2, false)).assertNull();
                done()
            } catch (error) {
                console.info("----------------error: " + error.code)
            }
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_141
         * @tc.name      testGetWorkStatusFun001
         * @tc.desc      test getWorkStatus Callback workId error. 
         */
        it("testGetWorkStatusFun001", 0, async function (done) {
            console.info('----------------------testGetWorkStatusFun001---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 9,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
            }
            try {
                workScheduler.startWork(workInfo)
            } catch (error) {
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
            };
            workScheduler.getWorkStatus(10, (error, res) => {
                if (error) {
                    console.info('testGetWorkStatusFun001 getWorkStatuscallback fail because:' + error.code);
                    expect(error.code).assertLarger(0)
                } else {
                    for (let item in res) {
                        console.info('testGetWorkStatusFun001 getWorkStatuscallback success,' + item + ' is:' + 
                        res[item]);
                    }
                    expect(res).assertInstanceOf('Object')
                }
            });
            setTimeout(()=>{
                done();
            }, 500);
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_142
         * @tc.name      testGetWorkStatusFun002
         * @tc.desc      test getWorkStatus Promise workId error. 
         */
        it("testGetWorkStatusFun002", 0, async function (done) {
            console.info('----------------------testGetWorkStatusFun002---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 9,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY,
                batteryLevel: 15
            }
            try {
                workScheduler.startWork(workInfo);
            } catch (error) {
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
            };
            workScheduler.getWorkStatus(10).then((res) => {
                for (let item in res) {
                    console.info('testGetWorkStatusFun002 getWorkStatuscallback success,' + item + ' is:' + 
                    res[item]);
                }
                expect(res).assertInstanceOf('Object')
            }).catch((error) => {
                console.info('testGetWorkStatusFun002 getWorkStatuscallback fail because:' + error.code);
                expect(error.code).assertLarger(0)
            })
            setTimeout(()=>{
                done();
            }, 500);
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_143
         * @tc.name      testGetWorkStatusFun003
         * @tc.desc      test getWorkStatus Promise parameter undefined. 
         */
        it("testGetWorkStatusFun003", 0, async function (done) {
            console.info('----------------------testGetWorkStatusFun003---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 9,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY,
                batteryLevel: 15
            }
            try {
                workScheduler.startWork(workInfo);
            } catch (error) {
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
            };
            try{
                workScheduler.getWorkStatus(undefined).then((res) => {
                    for (let item in res) {
                        console.info('testGetWorkStatusFun003 getWorkStatuspromise success,' + item + ' is:' + 
                        res[item]);
                    }
                    expect(res).assertInstanceOf('Object')
                }).catch((error) => {
                    console.info('testGetWorkStatusFun003 getWorkStatuspromise fail because:' + error.code);
                    expect(error.code).assertLarger(0)
                })
            }catch(error){
                console.info('testGetWorkStatusFun003 getWorkStatuspromise fail because:' + error);
            }
            setTimeout(()=>{
                done();
            }, 500);
        })
    
       /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_144
         * @tc.name      testGetWorkStatusFun004
         * @tc.desc      test getWorkStatus Promise parameter StringType. 
         */
       it("testGetWorkStatusFun004", 0, async function (done) {
            console.info('----------------------testGetWorkStatusFun004---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 9,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY,
                batteryLevel: 15
            }
            try {
                workScheduler.startWork(workInfo);
            } catch (error) {
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
            };
            try{
                workScheduler.getWorkStatus('9').then((res) => {
                    for (let item in res) {
                        console.info('testGetWorkStatusFun004 getWorkStatuspromise success,' + item + ' is:' + 
                        res[item]);
                    }
                    expect(res).assertInstanceOf('Object')
                }).catch((error) => {
                    console.info('testGetWorkStatusFun004 getWorkStatuspromise fail because:' + error.code);
                    expect(error.code).assertLarger(0)
                })
            }catch(error){
                console.info('testGetWorkStatusFun004 getWorkStatuspromise fail because:' + error);
            }
            setTimeout(()=>{
                done();
            }, 500);
    })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_145
         * @tc.name      testObtainAllWorksFun001
         * @tc.desc      test obtainAllWorks Callback. 
         */
        it("testObtainAllWorksFun001", 0, async function (done) {
            console.info('----------------------testObtainAllWorksFun001---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 145,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY,
            }
            try {
                workScheduler.startWork(workInfo);
            } catch (error) {
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
            };
            workScheduler.obtainAllWorks((error, res) =>{
                if (error) {
                    console.info('testObtainAllWorksFun001 obtainAllWorks callback fail, because:' + error.code);
                    expect(error.code).assertLarger(0)
                } else {
                    console.info('testObtainAllWorksFun001 obtainAllWorks callback success, data is:' + 
                    JSON.stringify(res));
                    expect(res[0].workId).assertEqual(workInfo.workId)
                }
            });
            setTimeout(()=>{
                done();
            }, 500);   
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_146
         * @tc.name      testObtainAllWorksFun002
         * @tc.desc      test first stop work then obtainAllWorks Promise. 
         */
        it("testObtainAllWorksFun002", 0, async function (done) {
            console.info('----------------------testObtainAllWorksFun002---------------------------');
            let workInfo = {
                workId: 146,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY,
            }
            try {
                workScheduler.startWork(workInfo);
            } catch (error) {
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
            };
            workScheduler.stopAndClearWorks();
            workScheduler.obtainAllWorks().then((res) => {
                console.info('testObtainAllWorksFun002 obtainAllWorks promise success, data is:' + 
                JSON.stringify(res));
            }).catch((error) => {
                console.info('testObtainAllWorksFun002 obtainAllWorks promise failed, because:' + error.code);
                expect(error.code).assertLarger(0)
            })
            setTimeout(()=>{
                done();
            }, 500);
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_147
         * @tc.name      testStopAndClearWorksFun001
         * @tc.desc      test repeat stopAndClearWorks. 
         */
        it("testStopAndClearWorksFun001", 0, async function (done) {
            console.info('----------------------testStopAndClearWorksFun001---------------------------');
            let workInfo = {
                workId: 147,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
            }
            try {
                workScheduler.startWork(workInfo);
            } catch (error) {
                console.info("----------------error: " + error.code);
                expect(error.code).assertEqual("401");
            };
            let stopRes1 = workScheduler.stopAndClearWorks();
            let stopRes2 = workScheduler.stopAndClearWorks();
            if(stopRes1 === true){
                console.info('testStopAndClearWorksFun001 repeat stopAndClearWorks success stopRes2: ' + stopRes2);
                expect(stopRes2).assertEqual(true)
            }
            done();
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_148
         * @tc.name      testIsLastWorkTimeOutFun001
         * @tc.desc      test isLastWorkTimeOut callback parameter workId < 0. 
         */
        it("testIsLastWorkTimeOutFun001", 0, async function (done) {
            console.info('----------------------testIsLastWorkTimeOutFun001---------------------------');
            workScheduler.isLastWorkTimeOut(-1, (error, res) =>{
                if (error) {
                    console.info('testIsLastWorkTimeOutFun001 isLastWorkTimeOut callback fail, because:' + error.code);
                    expect(error.code).assertEqual(9700004);
                    done();
                } else {
                    console.info('testIsLastWorkTimeOutFun001 isLastWorkTimeOut callback success, data is:' + res);
                }
            });
        })
    
        /*
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_150
         * @tc.name      testIsLastWorkTimeOutFun003
         * @tc.desc      test isLastWorkTimeOut promise parameter workId is StringType. 
         */
        it("testIsLastWorkTimeOutFun003", 0, async function (done) {
            console.info('----------------------testIsLastWorkTimeOutFun003---------------------------');
            try{
                workScheduler.isLastWorkTimeOut('1').then(res => {
                    console.info('testIsLastWorkTimeOutFun003 isLastWorkTimeOut promise success, data is:' + res);
                })
                .catch(error => {
                    console.info('testIsLastWorkTimeOutFun003 isLastWorkTimeOut promise fail, because:' + error.code);
            });
            }catch(error){
                console.info('testIsLastWorkTimeOutFun003 isLastWorkTimeOut promise fail ,' + error);
                expect(error.code).assertEqual('401');
                done();
            }
        })
    
        /*testStartWorkFun020
         * @tc.number    SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_151
         * @tc.name      testIsLastWorkTimeOutFun004
         * @tc.desc      test isLastWorkTimeOut promise parameter workId is NullType. 
         */
        it("testIsLastWorkTimeOutFun004", 0, async function (done) {
            console.info('----------------------testIsLastWorkTimeOutFun004---------------------------');
            try{
                workScheduler.isLastWorkTimeOut(null).then(res => {
                    console.info('testIsLastWorkTimeOutFun004 isLastWorkTimeOut promise success, data is:' + res);
                })
                .catch(error => {
                    console.info('testIsLastWorkTimeOutFun004 isLastWorkTimeOut promise fail, because:' + error.code);
            });
            }catch(error){
                console.info('testIsLastWorkTimeOutFun004 isLastWorkTimeOut promise fail ,' + error);
                expect(error.code).assertEqual('401');
                done();
            }
        })
    })
}
