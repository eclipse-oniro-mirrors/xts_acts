/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import sensor from '@system.sensor';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_24() {
describe("SensorJsTest_sensor_24", function () {
    beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll caled')
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll caled')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach caled')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach caled')
    })

    /*
     * @tc.number:SUB_SensorsSystem_GetOnBodyState_JSTest_0010
     * @tc.name: getOnBodyState_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("getOnBodyState_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest001---------------------------');
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest001 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
                done();
            },
            fail: function (data, code) {
                console.log("getOnBodyState_SensorJsTest001 is failed, data: " + data + ", code: " + code);
                expect(false).assertTrue();
            },
            complete: function () {
                console.log('getOnBodyState_SensorJsTest001 is completed');
            }
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_GetOnBodyState_JSTest_0020
     * @tc.name: getOnBodyState_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("getOnBodyState_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest002---------------------------');
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest002 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
                done();
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_GetOnBodyState_JSTest_0030
     * @tc.name: getOnBodyState_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("getOnBodyState_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest003---------------------------');
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest003 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
                done();
            },
            fail: function (data, code) {
                console.error('getOnBodyState_SensorJsTest003 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
    })

   /*
     * @tc.number:SUB_SensorsSystem_GetOnBodyState_JSTest_0040
     * @tc.name: getOnBodyState_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("getOnBodyState_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest004---------------------------');
        sensor.getOnBodyState({
            inInvalid: 2,
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest004 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
                done();
            },
            fail: function (data, code) {
                console.error('getOnBodyState_SensorJsTest004 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_GetOnBodyState_JSTest_0050
     * @tc.name: getOnBodyState_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("getOnBodyState_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest005---------------------------');
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest005 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
            },
            fail: function (data, code) {
                console.error('getOnBodyState_SensorJsTest005 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest005_1 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
            },
            fail: function (data, code) {
                console.error('getOnBodyState_SensorJsTest005_1 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
        setTimeout(() => {
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_SensorsSystem_GetOnBodyState_JSTest_0060
     * @tc.name: getOnBodyState_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("getOnBodyState_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------getOnBodyState_SensorJsTest006---------------------------');
        sensor.getOnBodyState({
            success: function (data) {
                console.info("getOnBodyState_SensorJsTest006 success:" + JSON.stringify(data));
                expect(typeof (data.value)).assertEqual("boolean");
                done();
            },
            fail: function (data, code) {
                console.error('getOnBodyState_SensorJsTest006 failed. Code: ' + code + '; Data: ' + data);
                expect(false).assertTrue();
            },
        });
    })
})}
