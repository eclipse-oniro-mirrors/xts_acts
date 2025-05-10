/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import systemLoad from '@ohos.resourceschedule.systemload';

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function ThermalControlMgrTest() {
    describe("ThermalControlMgrTest", function () {
        beforeAll(function() {
            
            /*
             * @tc.setup: setup invoked before all testcases
             */
             console.info('beforeAll called')
        })
    
        afterAll(function() {
            
            /*
             * @tc.teardown: teardown invoked after all testcases
             */
             console.info('afterAll called')
        })
    
        beforeEach(function() {
            
            /*
             * @tc.setup: setup invoked before each testcases
             */
             console.info('beforeEach called')
        })
    
        afterEach(function() {
            
            /*
             * @tc.teardown: teardown invoked after each testcases
             */
             console.info('afterEach called')
        })
    
        /*
         * @tc.number:SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_001
         * @tc.name: ThermalControlMgrTest001
         * @tc.desc: test request On successful
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 0
         * @tc.require
         */
        it("ThermalControlMgrTest001", 0, async function (done) {
            console.info('----------------------ThermalControlMgrTest001---------------------------');
            function onSystemLoadChange(res) {
                console.info('ThermalControlMgrTest001 res is ' + res);    
            }
            
            try {
                systemLoad.on('systemLoadChange', onSystemLoadChange);
                console.info('ThermalControlMgrTest001 callback successful');
                
                expect(true).assertTure();

            } catch (err) {
                console.error('ThermalControlMgrTest001 err.code is ' + JSON.stringify(err.code));
            }
            done();
        })

        /*
         * @tc.number:SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_002
         * @tc.name: ThermalControlMgrTest002
         * @tc.desc: test request Off successful
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 0
         * @tc.require
         */
        it("ThermalControlMgrTest002", 0, async function (done) {
            console.info('----------------------ThermalControlMgrTest002---------------------------');
            function onSystemLoadChange(res) {
                console.info('ThermalControlMgrTest002 res is ' + res);
            }
            
            try {
                systemLoad.off('systemLoadChange', onSystemLoadChange);
                console.info('ThermalControlMgrTest002 callback successful');

                expect(true).assertTure();
            } catch (err) {
                console.error('ThermalControlMgrTest002 err.code is ' + JSON.stringify(err.code));
            }
            done();
        })

        /*
         * @tc.number:SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_003
         * @tc.name: ThermalControlMgrTest003
         * @tc.desc: test request getLevel successful
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 0
         * @tc.require
         */
        it("ThermalControlMgrTest003", 0, async function (done) {
            console.info('----------------------ThermalControlMgrTest003---------------------------');
            systemLoad.getLevel().then((res) => {
                console.log('ThermalControlMgrTest003 promise res is ' + JSON.stringify(res));
                let level = res

                expect(level).assertLess(7);
                done();
            }).catch((err) => {
                console.error('ThermalControlMgrTest003 err is ' + JSON.stringify(err));
            })
        })

        /*
         * @tc.number:SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_004
         * @tc.name: ThermalControlMgrTest004
         * @tc.desc: test SystemLoadLevel is LOW
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 0
         * @tc.require
         */
        it("ThermalControlMgrTest004", 0, async function (done) {
            console.info('----------------------ThermalControlMgrTest004---------------------------');
            let level = systemLoad.SystemLoadLevel.LOW

            expect(level).assertEqual(0);
            done();
        })

        /*
         * @tc.number:SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_005
         * @tc.name: ThermalControlMgrTest005
         * @tc.desc: test SystemLoadLevel is NORMAL
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 0
         * @tc.require
         */
        it("ThermalControlMgrTest005", 0, async function (done) {
            console.info('----------------------ThermalControlMgrTest005---------------------------');
            let level = systemLoad.SystemLoadLevel.NORMAL

            expect(level).assertEqual(1);
            done();
        })

        /*
         * @tc.number:SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_006
         * @tc.name: ThermalControlMgrTest006
         * @tc.desc: test SystemLoadLevel is MEDIUM
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 0
         * @tc.require
         */
        it("ThermalControlMgrTest006", 0, async function (done) {
            console.info('----------------------ThermalControlMgrTest006---------------------------');
            let level = systemLoad.SystemLoadLevel.MEDIUM

            expect(level).assertEqual(2);
            done();
        })

        /*
         * @tc.number:SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_007
         * @tc.name: ThermalControlMgrTest007
         * @tc.desc: test SystemLoadLevel is HIGH
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 0
         * @tc.require
         */
        it("ThermalControlMgrTest007", 0, async function (done) {
            console.info('----------------------ThermalControlMgrTest007---------------------------');
            let level = systemLoad.SystemLoadLevel.HIGH

            expect(level).assertEqual(3);
            done();
        })

        /*
         * @tc.number:SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_008
         * @tc.name: ThermalControlMgrTest008
         * @tc.desc: test SystemLoadLevel is OVERHEATED
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 0
         * @tc.require
         */
        it("ThermalControlMgrTest008", 0, async function (done) {
            console.info('----------------------ThermalControlMgrTest008---------------------------');
            let level = systemLoad.SystemLoadLevel.OVERHEATED

            expect(level).assertEqual(4);
            done();
        })

        /*
         * @tc.number:SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_009
         * @tc.name: ThermalControlMgrTest009
         * @tc.desc: test SystemLoadLevel is WARNNING
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 0
         * @tc.require
         */
        it("ThermalControlMgrTest009", 0, async function (done) {
            console.info('----------------------ThermalControlMgrTest009---------------------------');
            let level = systemLoad.SystemLoadLevel.WARNING

            expect(level).assertEqual(5);
            done();
        })

        /*
         * @tc.number:SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_010
         * @tc.name: ThermalControlMgrTest010
         * @tc.desc: test SystemLoadLevel is EMERGENCY
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 0
         * @tc.require
         */
        it("ThermalControlMgrTest010", 0, async function (done) {
            console.info('----------------------ThermalControlMgrTest010---------------------------');
            let level = systemLoad.SystemLoadLevel.EMERGENCY

            expect(level).assertEqual(6);
            done();
        })

        /*
         * @tc.number:SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_011
         * @tc.name: ThermalControlMgrTest011
         * @tc.desc: test SystemLoadLevel is RSCAPTE
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 0
         * @tc.require
         */
        it("ThermalControlMgrTest011", 0, async function (done) {
            console.info('----------------------ThermalControlMgrTest011---------------------------');
            let level = systemLoad.SystemLoadLevel.ESCAPE

            expect(level).assertEqual(7);
            done();
        })
    })
    }