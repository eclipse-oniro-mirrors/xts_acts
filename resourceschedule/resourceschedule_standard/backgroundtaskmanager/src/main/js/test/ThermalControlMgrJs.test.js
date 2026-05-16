/*
 * Copyright (C) 2024-2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

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
    
        /**
         * @tc.name   ThermalControlMgrTest001
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_001
         * @tc.desc   test request On successful
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest001", Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   ThermalControlMgrTest002
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_002
         * @tc.desc   test request Off successful
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest002", Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   ThermalControlMgrTest003
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_003
         * @tc.desc   test request getLevel successful
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest003", Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   ThermalControlMgrTest004
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_004
         * @tc.desc   test SystemLoadLevel is LOW
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest004", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest004---------------------------');
            let level = systemLoad.SystemLoadLevel.LOW

            expect(level).assertEqual(0);
            done();
        })

        /**
         * @tc.name   ThermalControlMgrTest005
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_005
         * @tc.desc   test SystemLoadLevel is NORMAL
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest005", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest005---------------------------');
            let level = systemLoad.SystemLoadLevel.NORMAL

            expect(level).assertEqual(1);
            done();
        })

        /**
         * @tc.name   ThermalControlMgrTest006
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_006
         * @tc.desc   test SystemLoadLevel is MEDIUM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest006", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest006---------------------------');
            let level = systemLoad.SystemLoadLevel.MEDIUM

            expect(level).assertEqual(2);
            done();
        })

        /**
         * @tc.name   ThermalControlMgrTest007
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_007
         * @tc.desc   test SystemLoadLevel is HIGH
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest007", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest007---------------------------');
            let level = systemLoad.SystemLoadLevel.HIGH

            expect(level).assertEqual(3);
            done();
        })

        /**
         * @tc.name   ThermalControlMgrTest008
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_008
         * @tc.desc   test SystemLoadLevel is OVERHEATED
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest008", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest008---------------------------');
            let level = systemLoad.SystemLoadLevel.OVERHEATED

            expect(level).assertEqual(4);
            done();
        })

        /**
         * @tc.name   ThermalControlMgrTest009
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_009
         * @tc.desc   test SystemLoadLevel is WARNNING
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest009", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest009---------------------------');
            let level = systemLoad.SystemLoadLevel.WARNING

            expect(level).assertEqual(5);
            done();
        })

        /**
         * @tc.name   ThermalControlMgrTest010
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_010
         * @tc.desc   test SystemLoadLevel is EMERGENCY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest010", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest010---------------------------');
            let level = systemLoad.SystemLoadLevel.EMERGENCY

            expect(level).assertEqual(6);
            done();
        })

        /**
         * @tc.name   ThermalControlMgrTest011
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_011
         * @tc.desc   test SystemLoadLevel is RSCAPTE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest011", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest011---------------------------');
            let level = systemLoad.SystemLoadLevel.ESCAPE

            expect(level).assertEqual(7);
            done();
        })

        /**
         * @tc.name   ThermalControlMgrTest012
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_012
         * @tc.desc   test request On null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest012", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest012---------------------------');
            function onSystemLoadChange(res) {
                console.info('ThermalControlMgrTest012 res is ' + res);
            }

            try {
                systemLoad.on(null, onSystemLoadChange);
                console.info('ThermalControlMgrTest012 callback successful');
                expect(false).assertTure();
            } catch (err) {
                console.error('ThermalControlMgrTest012 err.code is ' + JSON.stringify(err.code));
                expect(err.code).assertEqual(401);
            }
            done();
        })

        /**
         * @tc.name   ThermalControlMgrTest013
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_013
         * @tc.desc   test request On undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest013", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest013---------------------------');
            function onSystemLoadChange(res) {
                console.info('ThermalControlMgrTest013 res is ' + res);
            }

            try {
                systemLoad.on(undefined, onSystemLoadChange);
                console.info('ThermalControlMgrTest013 callback successful');
                expect(false).assertTure();
            } catch (err) {
                console.error('ThermalControlMgrTest013 err.code is ' + JSON.stringify(err.code));
                expect(err.code).assertEqual(401);
            }
            done();
        })


        /**
         * @tc.name   ThermalControlMgrTest014
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_014
         * @tc.desc   test request Off null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest014", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest014---------------------------');
            function onSystemLoadChange(res) {
                console.info('ThermalControlMgrTest014 res is ' + res);
            }

            try {
                systemLoad.off(null, onSystemLoadChange);
                console.info('ThermalControlMgrTest014 callback successful');
                expect(false).assertTure();
            } catch (err) {
                console.error('ThermalControlMgrTest014 err.code is ' + JSON.stringify(err.code));
                expect(err.code).assertEqual(401);
            }
            done();
        })

        /**
         * @tc.name   ThermalControlMgrTest015
         * @tc.number SUB_RESOURCESCHEDULE_THERMAL_CONTROL_XTS_015
         * @tc.desc   test request Off undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("ThermalControlMgrTest015", Level.LEVEL0, async function (done) {
            console.info('----------------------ThermalControlMgrTest015---------------------------');
            function onSystemLoadChange(res) {
                console.info('ThermalControlMgrTest015 res is ' + res);
            }

            try {
                systemLoad.off(undefined, onSystemLoadChange);
                console.info('ThermalControlMgrTest015 callback successful');
                expect(false).assertTure();
            } catch (err) {
                console.error('ThermalControlMgrTest015 err.code is ' + JSON.stringify(err.code));
                expect(err.code).assertEqual(401);
            }
            done();
        })

    })
    }