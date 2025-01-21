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

export default function SensorJsTest_sensor_30() {
describe("SensorJsTest_sensor_30", function () {
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
     * @tc.number:SUB_SensorsSystem_SubscribeHeartRate_JSTest_0010
     * @tc.name:subscribeHeartRate_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeHeartRate_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------subscribeHeartRate_SensorJsTest001---------------------------');
        sensor.subscribeHeartRate({
            success: function (data) {
                console.info("subscribeHeartRate_SensorJsTest001 success" + JSON.stringify(data));
                expect(typeof (data.pressure)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeHeartRate_SensorJsTest001 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        setTimeout(() => {
          sensor.unsubscribeHeartRate();
          done();
        }, 1000);
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeHeartRate_JSTest_0020
     * @tc.name: subscribeHeartRate_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeHeartRate_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info('----------------------subscribeHeartRate_SensorJsTest002---------------------------');
        sensor.subscribeHeartRate({
            success: function (data) {
                console.info("subscribeHeartRate_SensorJsTest002 success:" + JSON.stringify(data));
                expect(typeof (data.pressure)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeHeartRate_SensorJsTest002 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        sensor.subscribeHeartRate({
            success: function (data) {
                console.info("subscribeHeartRate_SensorJsTest002_1 success:" + JSON.stringify(data));
                expect(typeof (data.pressure)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeHeartRate_SensorJsTest002_1 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
        setTimeout(() => {
           sensor.unsubscribeHeartRate();
           done();
        }, 1000);
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeHeartRate_JSTest_0030
     * @tc.name: subscribeHeartRate_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeHeartRate_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info('----------------------subscribeHeartRate_SensorJsTest003---------------------------');
        sensor.subscribeHeartRate({
            success: function (data) {
                console.info("subscribeHeartRate_SensorJsTest003 success:" + JSON.stringify(data));
                expect(typeof (data.pressure)).assertEqual("number");
            },
            fail: function (data, code) {
                console.error('subscribeHeartRate_SensorJsTest003 failed. Code: ' + code + '; Data: ' + data);
                expect(code).assertEqual(1001);
            },
        });
		setTimeout(() => {
            sensor.unsubscribeHeartRate();
            done();
        }, 500);
    })
})}
