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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

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
    
        /**
         * @tc.name   testStartWorkFun001
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_072
         * @tc.desc   test workScheduler workInfo networkType is MOBILE.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun001", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun002
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_073
         * @tc.desc   test workScheduler workInfo networkType is WIFI.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun002", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun003
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_074
         * @tc.desc   test workScheduler workInfo networkType is BLUETOOTH.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun003", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun004
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_075
         * @tc.desc   test workScheduler workInfo networkType is WIFI_P2P.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun004", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun005
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_076
         * @tc.desc   test workScheduler workInfo networkType is ETHERNET.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun005", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun006
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_077
         * @tc.desc   test workScheduler workInfo chargerType is ANY.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun006", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun007
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_078
         * @tc.desc   test workScheduler workInfo chargerType is USB.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun007", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun008
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_079
         * @tc.desc   test workScheduler workInfo chargerType is WIRELESS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun008", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun009
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_080
         * @tc.desc   test workScheduler workInfo BatteryStatus OKAY.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun009", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun010
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_081
         * @tc.desc   test workScheduler workInfo BatteryStatus LOW_OR_OKAY.
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
                batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_LOW_OR_OKAY
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("----------------error: " + error.code);
            }
        })
    
        /**
         * @tc.name   testStartWorkFun011
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_082
         * @tc.desc   test workScheduler workInfo storageRequest LOW.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun011", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun012
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_083
         * @tc.desc   test workScheduler workInfo storageRequest OKAY.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun012", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun013
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_084
         * @tc.desc   test workScheduler workInfo storageRequest LOW_OR_OKAY.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun013", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun014
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_085
         * @tc.desc   test workScheduler workInfo select all parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun014", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun015
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_086
         * @tc.desc   test workScheduler workInfo select networkType,batteryLevel,batteryStatus,storageRequest.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun015", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun016
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_087
         * @tc.desc   test start workScheduler workId is StringType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun016", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun017
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_088
         * @tc.desc   test start workScheduler workId is NullType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun017", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun018
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_089
         * @tc.desc   test start workScheduler without workId.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun018", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun019
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_090
         * @tc.desc   test start workScheduler bundleName is NumberType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun019", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun020
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_091
         * @tc.desc   test start workScheduler bundleName error.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun020", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun021
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_092
         * @tc.desc   test start workScheduler bundleName is NullType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun021", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun022
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_093
         * @tc.desc   test start workScheduler abilityName is NumberType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun022", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun023
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_094
         * @tc.desc   test start workScheduler abilityName is EmptyString.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun023", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun024
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_095
         * @tc.desc   test start workScheduler abilityName is a space.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun024", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun025
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_096
         * @tc.desc   test start workScheduler abilityName is NullType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun025", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun026
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_097
         * @tc.desc   test start workScheduler networkType < 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun026", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun027
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_098
         * @tc.desc   test start workScheduler networkType > 5.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun027", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun028
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_099
         * @tc.desc   test start workScheduler chargerType < 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun028", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun029
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_100
         * @tc.desc   test start workScheduler chargerType > 3.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun029", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun030
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_101
         * @tc.desc   test start workScheduler isCharging is NumberType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun030", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun031
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_102
         * @tc.desc   test start workScheduler isCharging is StringType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun031", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun032
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_103
         * @tc.desc   test start workScheduler without isCharging.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun032", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun033
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_104
         * @tc.desc   test start workScheduler batteryLevel < 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun033", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun034
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_105
         * @tc.desc   test start workScheduler batteryLevel = 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun034", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun035
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_106
         * @tc.desc   test start workScheduler batteryLevel = 100.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun035", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun036
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_107
         * @tc.desc   test start workScheduler batteryLevel > 100.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun036", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun037
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_108
         * @tc.desc   test start workScheduler batteryStatus < 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun037", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun038
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_109
         * @tc.desc   test start workScheduler batteryStatus > 2.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun038", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun039
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_110
         * @tc.desc   test start workScheduler storageRequest < 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun039", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun040
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_111
         * @tc.desc   test start workScheduler storageRequest > 2.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun040", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun041
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_112
         * @tc.desc   test start workScheduler repeatCycleTime < 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun041", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun042
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_113
         * @tc.desc   test start workScheduler repeatCycleTime < 20min.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun042", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun043
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_114
         * @tc.desc   test start workScheduler condition only repeatCycleTime.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun043", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun044
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_115
         * @tc.desc   test start workScheduler without repeatCycleTime.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun044", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun045
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_116
         * @tc.desc   test start workScheduler isRepeat is StringType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun045", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun046
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_117
         * @tc.desc   test start workScheduler repeatCount = 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun046", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun047
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_118
         * @tc.desc   test start workScheduler repeatCount < 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun047", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun048
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_119
         * @tc.desc   test start workScheduler isRepeat = false and repeatCount < 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun048", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun049
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_120
         * @tc.desc   test start workScheduler condition only repeatCount.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun049", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun050
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_121
         * @tc.desc   test start workScheduler isPersisted is StringType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun050", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun051
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_122
         * @tc.desc   test start workScheduler isPersisted is NumberType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun051", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun052
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_123
         * @tc.desc   test start workScheduler isDeepIdle is StringType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun052", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStartWorkFun053
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_124
         * @tc.desc   test start workScheduler isDeepIdle is NumberType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun053", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun001
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_125
         * @tc.desc   test stop workScheduler needCancel is StringType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun001", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun002
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_126
         * @tc.desc   test stop workScheduler needCancel is NumberType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun002", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun003
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_127
         * @tc.desc   test stop workScheduler needCancel is NullType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun003", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun004
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_128
         * @tc.desc   test stop workScheduler missing parameter needCancel.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun004", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun005
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_129
         * @tc.desc   test stop workScheduler workId error ,needCancel true.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun005", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun006
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_130
         * @tc.desc   test stop workScheduler workId error ,needCancel false.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun006", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun007
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_131
         * @tc.desc   test stop workScheduler bundleName error,needCancel true.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun007", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun008
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_132
         * @tc.desc   test stop workScheduler bundleName error,needCancel false.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun008", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun009
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_133
         * @tc.desc   test stop workScheduler abilityName error,needCancel true.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun009", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun010
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_134
         * @tc.desc   test stop workScheduler abilityName error,needCancel false.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun010", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun011
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_135
         * @tc.desc   test stop workScheduler networkType different.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun011", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun012
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_136
         * @tc.desc   test stop workScheduler chargerType different.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun012", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun013
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_137
         * @tc.desc   test stop workScheduler batteryStatus different.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun013", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun014
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_138
         * @tc.desc   test stop workScheduler storageRequest different.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun014", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun015
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_139
         * @tc.desc   test stop workScheduler isPersisted different.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun015", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopWorkFun016
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_140
         * @tc.desc   test stop workScheduler repeatCycleTime different.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopWorkFun016", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testGetWorkStatusFun001
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_141
         * @tc.desc   test getWorkStatus Callback workId error.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetWorkStatusFun001", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testGetWorkStatusFun002
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_142
         * @tc.desc   test getWorkStatus Promise workId error.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetWorkStatusFun002", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testGetWorkStatusFun003
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_143
         * @tc.desc   test getWorkStatus Promise parameter undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetWorkStatusFun003", Level.LEVEL0, async function (done) {
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
    
       /**
        * @tc.name   testGetWorkStatusFun004
        * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_144
        * @tc.desc   test getWorkStatus Promise parameter StringType.
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
       it("testGetWorkStatusFun004", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testObtainAllWorksFun001
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_145
         * @tc.desc   test obtainAllWorks Callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testObtainAllWorksFun001", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testObtainAllWorksFun002
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_146
         * @tc.desc   test first stop work then obtainAllWorks Promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testObtainAllWorksFun002", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testStopAndClearWorksFun001
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_147
         * @tc.desc   test repeat stopAndClearWorks.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStopAndClearWorksFun001", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testIsLastWorkTimeOutFun001
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_148
         * @tc.desc   test isLastWorkTimeOut callback parameter workId < 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testIsLastWorkTimeOutFun001", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testIsLastWorkTimeOutFun003
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_150
         * @tc.desc   test isLastWorkTimeOut promise parameter workId is StringType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testIsLastWorkTimeOutFun003", Level.LEVEL0, async function (done) {
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
    
        /**
         * @tc.name   testIsLastWorkTimeOutFun004
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_151
         * @tc.desc   test isLastWorkTimeOut promise parameter workId is NullType.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testIsLastWorkTimeOutFun004", Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   testGetWorkStatusFun005
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_152
         * @tc.desc   test getWorkStatus promise errorcode is 9700004.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetWorkStatusFun005", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetWorkStatusFun006---------------------------');
            try{
                workScheduler.getWorkStatus(1234).then(res => {
                    console.info('testGetWorkStatusFun005 isLastWorkTimeOut promise success, data is:' + res);
                })
                .catch(error => {
                    console.info('testGetWorkStatusFun005 isLastWorkTimeOut promise fail, because:' + error.code);
                    expect(error.code).assertEqual(9700004);
                done();
            });
            }catch(error){
                console.info('testGetWorkStatusFun005 isLastWorkTimeOut promise fail ,' + error.code);               
            }
        })

         /**
          * @tc.name   testGetWorkStatusFun006
          * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_153
          * @tc.desc   test getWorkStatus callback errorcode is 9700004.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it("testGetWorkStatusFun006", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetWorkStatusFun006---------------------------');
            try{
                workScheduler.getWorkStatus(10, (error, res) => {
                    if (error) {
                        console.info('testGetWorkStatusFun006 getWorkStatuscallback fail because:' + error.code);
                        expect(error.code).assertEqual(9700004);
                        done();
                    } else {
                        console.info('testGetWorkStatusFun006 isLastWorkTimeOut promise success, data is:' + res);
                    }
                });
            }catch(error){
                console.info('testGetWorkStatusFun006 getWorkStatus promise fail ,' + error.code);                
            }
        })

        /**
         * @tc.name   testStartWorkFun054
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0154
         * @tc.desc   test workScheduler workInfo parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun054", Level.LEVEL0, async function (done) {
            console.info('----------------------testStartWorkFun054---------------------------');
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
                isDeepIdle: false,
                parameters: {
                    mykey0: 1,
                    mykey1: "string value",
                    mykey2: true,
                    mykey3: 1.5
                }
            }
            try{
                expect(workScheduler.startWork(workInfo)).assertNull();
                done()
            }catch(error){
                console.info("testStartWorkFun054----------------error: " + error.code);
            }
        })

        /**
         * @tc.name   testStartWorkFun055
         * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_XTS_0155
         * @tc.desc   test workScheduler workInfo earliestStartTime.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testStartWorkFun055", Level.LEVEL0, async function (done) {
            console.info('----------------------testStartWorkFun055---------------------------');
            workScheduler.stopAndClearWorks();
            let workInfo = {
                workId: 15,
                bundleName: "ohos.acts.resourceschedule.workscheduler.js.function",
                abilityName: "com.mytest.abilityName",
                networkType: 0,
                isCharging: false,
                batteryLevel: 50,
                batteryStatus: 1,
                storageRequest: 1,
                isRepeat: false,
                isPersisted: false,
                isDeepIdle: false,
                parameters: {
                    mykey0: 1,
                    mykey1: "string value",
                    mykey2: true,
                    mykey3: 1.5
                },
                earliestStartTime: 50
            }
            try{
                workScheduler.startWork(workInfo);
                workScheduler.getWorkStatus(15).then((res) => {
                    console.info('testStartWorkFun055 getWorkStatus callback success, data is:' + 
                    JSON.stringify(res));
                    expect(res.earliestStartTime).assertEqual(50);
                    done();
                }).catch((error) => {
                    console.info('testStartWorkFun055 getWorkStatuspromise fail because:' + error.code);
                    done();
                })
            
            }catch(error){
                console.info("testStartWorkFun055----------------error: " + error.code);
            }
        })
    })
}
