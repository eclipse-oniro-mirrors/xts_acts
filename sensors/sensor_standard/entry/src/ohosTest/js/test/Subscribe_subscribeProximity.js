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
import sensor from '@system.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_33() {
describe("SensorJsTest_sensor_33", function () {
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

    /**
     * @tc.name   subscribeProximity_SensorJsTest001
     * @tc.number SUB_SensorsSystem_SubscribeProximity_JSTest_0010
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("subscribeProximity_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest001---------------------------');
        sensor.subscribeProximity({
            success: function (data) {
                console.info("subscribeProximity_SensorJsTest001 success" + JSON.stringify(data));
                expect(typeof (data.distance)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeProximity_SensorJsTest001 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        setTimeout(() => {
          sensor.unsubscribeProximity();
          done();
        }, 1000);
    })

    /**
     * @tc.name   subscribeProximity_SensorJsTest002
     * @tc.number SUB_SensorsSystem_SubscribeProximity_JSTest_0020
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("subscribeProximity_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest002---------------------------');
        sensor.subscribeProximity({
            success: function (data) {
                console.info("subscribeProximity_SensorJsTest002 success:" + JSON.stringify(data));
                expect(typeof (data.distance)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeProximity_SensorJsTest002 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        sensor.subscribeProximity({
            success: function (data) {
                console.info("subscribeProximity_SensorJsTest002_1 success:" + JSON.stringify(data));
                expect(typeof (data.distance)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeProximity_SensorJsTest002_1 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        setTimeout(() => {
           sensor.unsubscribeProximity();
           done();
        }, 1000);
    })

    /**
     * @tc.name   subscribeProximity_SensorJsTest003
     * @tc.number SUB_SensorsSystem_SubscribeProximity_JSTest_0030
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("subscribeProximity_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info('----------------------subscribeProximity_SensorJsTest003---------------------------');
        sensor.subscribeProximity({
            success: function (data) {
                console.info("subscribeProximity_SensorJsTest003 success:" + JSON.stringify(data));
                expect(typeof (data.distance)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeProximity_SensorJsTest003 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        setTimeout(() => {
            sensor.unsubscribeProximity();
            done();
        }, 500);
    })
})}
