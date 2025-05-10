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

export default function SensorJsTest_sensor_28() {
describe("SensorJsTest_sensor_28", function () {
    beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll called')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach called')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach called')
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeCompass_JSTest_0010
     * @tc.name: subscribeCompass_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeCompass_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest001---------------------------');
        sensor.subscribeCompass({
            interval: 'game',
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest001 success" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeCompass_SensorJsTest001 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
                done()
            },
        });
        setTimeout(() => {
            sensor.unsubscribeCompass();
            done();
        }, 1000);
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeCompass_JSTest_0020
     * @tc.name: subscribeCompass_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeCompass_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest002---------------------------');
        sensor.subscribeCompass({
            interval: 'ui',
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest002 success" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeCompass_SensorJsTest002 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
                done()
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeCompass_JSTest_0030
     * @tc.name: subscribeCompass_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeCompass_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest003---------------------------');
        sensor.subscribeCompass({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest003 success" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeCompass_SensorJsTest003 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
                done()
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeCompass_JSTest_0040
     * @tc.name: subscribeCompass_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeCompass_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest004---------------------------');
        sensor.subscribeCompass({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest004 success" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeCompass_SensorJsTest004 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
            },
        });

        sensor.subscribeCompass({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest004_1 success" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
                done()
            },
            fail: function (data, code) {
                console.log("subscribeCompass_SensorJsTest004_1 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
                done()
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeCompass_JSTest_0050
     * @tc.name: subscribeCompass_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeCompass_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest005---------------------------');
        sensor.subscribeCompass({
            interval: 'xxx',
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest005 success" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
            },
            fail: function (data, code) {
                console.log("subscribeCompass_SensorJsTest005 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
                done()
            },
        });
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeCompass_JSTest_0060
     * @tc.name: subscribeCompass_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("subscribeCompass_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeCompass_SensorJsTest006---------------------------');
        sensor.subscribeCompass({
            interval: 'normal',
            success: function (data) {
                console.info("subscribeCompass_SensorJsTest006 success" + JSON.stringify(data));
                expect(typeof (data.direction)).assertEqual("number");
                done();
            },
            fail: function (data, code) {
                console.log("subscribeCompass_SensorJsTest006 is failed, data: " + data + ", code: " + code);
                expect(data).assertEqual('subscribe fail');
                expect(code).assertEqual(1001);
                done()
            },
        });
    })
})}
