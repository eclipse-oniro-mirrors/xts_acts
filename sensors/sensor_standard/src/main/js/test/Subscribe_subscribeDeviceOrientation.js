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

export default function SensorJsTest_sensor_27() {
describe("SensorJsTest_sensor_27", function () {
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
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0010
     * @tc.name: subscribeDeviceOrientation_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest001---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'game',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest001 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest001 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
				done()
            },
        });
        setTimeout(() => {
            sensor.unsubscribeDeviceOrientation();
            done();
        }, 1000);
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0020
     * @tc.name: subscribeDeviceOrientation_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest002---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'ui',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest002 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
				done()
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest002 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
				done()
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0030
     * @tc.name: subscribeDeviceOrientation_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest003---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest003 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest003 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
				done()
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0040
     * @tc.name: subscribeDeviceOrientation_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest004---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest004 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest004 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
            },
        });

        sensor.subscribeDeviceOrientation({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest004_1 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
				done()
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest004_1 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
				done()
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0050
     * @tc.name: subscribeDeviceOrientation_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest005---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'xxx',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest005 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest005 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('input error');
                expect(code).assertEqual(202);
				done()
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeDeviceOrientation_JSTest_0060
     * @tc.name: subscribeDeviceOrientation_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeDeviceOrientation_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeDeviceOrientation_SensorJsTest006---------------------------');
        sensor.subscribeDeviceOrientation({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeDeviceOrientation_SensorJsTest006 success" + JSON.stringify(data));
                expect(typeof (data.alpha)).assertEqual("number");
                expect(typeof (data.beta)).assertEqual("number");
                expect(typeof (data.gamma)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeDeviceOrientation_SensorJsTest006 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
				done()
            },
        });
    })
})}
