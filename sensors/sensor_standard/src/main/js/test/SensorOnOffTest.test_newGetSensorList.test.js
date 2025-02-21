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
import sensor from '@ohos.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_35() {
describe("SensorJsTest_sensor_35", function () {
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

    let errMessage;
    let invild = -1;
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
	
   /**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0010
     * @tc.name: getSensorLists_SensorJsTest001
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
	it("getSensorLists_SensorJsTest001",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        sensor.getSensorList().then((data) => {	
		for (let i = 0; i < data.length; i++) {
            console.info("getSensorLists_SensorJsTest001 " + JSON.stringify(data[i]));
			done();
        }
        }, (error)=>{
            console.info('getSensorLists_SensorJsTest001 failed');
            expect(false).assertTrue();
        });
    })

	/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0020
     * @tc.name: getSensorLists_SensorJsTest002
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
	it("getSensorLists_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    sensor.getSensorList((error, data) => {	
        if (error) {
            console.info('getSensorLists_SensorJsTest002 error');
            expect(false).assertTrue();
        } else {
            for (let i =0; i < data.length; i++) {
                console.info("getSensorLists_SensorJsTest002 " + JSON.stringify(data[i]));
            }
            done()
        }
		});
	})

    /**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0030
     * @tc.name: getSensorLists_SensorJsTest003
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it("getSensorLists_SensorJsTest003", 0, async function (done) {
        sensor.getSensorList(null).then(data => {
            for (let i = 0; i < data.length; i++) {
                console.info("getSensorLists_SensorJsTest003 " + JSON.stringify(data[i]));
            }
            expect(true).assertTrue();
            done();
        }, (error) => {
            console.info('getSensorLists_SensorJsTest003 failed');
            expect(false).assertTrue();
            done();
        });
    })

/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0040
     * @tc.name: getSensorLists_SensorJsTest004
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
it("getSensorLists_SensorJsTest004", 0, async function (done) {
    sensor.getSensorList(errMessage).then(data => {
        for (let i = 0; i < data.length; i++) {
            console.info("getSensorLists_SensorJsTest004 " + JSON.stringify(data[i]));
        }
        expect(true).assertTrue();
        done();
    }, (error) => {
        console.info('getSensorLists_SensorJsTest004 failed');
        expect(false).assertTrue();
        done();
    });
})

/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0050
     * @tc.name: getSensorLists_SensorJsTest005
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
it("getSensorLists_SensorJsTest005", 0, async function (done) {
    sensor.getSensorList('xxx').then(data => {
        console.info("--getSensorLists_SensorJsTest005 callback in--" + data.length);
        for (let i = 0; i < data.length; i++) {
            console.info("getSensorLists_SensorJsTest005 " + JSON.stringify(data[i]));
        }
        expect(true).assertTrue();
        done();
    }, (error) => {
        console.info('getSensorLists_SensorJsTest005 failed');
        expect(false).assertTrue();
        done();
    });
})

	/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0060
     * @tc.name: getSensorLists_SensorJsTest006
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it("getSensorLists_SensorJsTest006", 0, async function (done) {
        sensor.getSensorList(invild).then(data => {
            console.info("--getSensorLists_SensorJsTest006 callback in--" + data.length);
            for (let i = 0; i < data.length; i++) {
                console.info("getSensorLists_SensorJsTest006 " + JSON.stringify(data[i]));
            }
            expect(true).assertTrue();
            done();
        }, (error) => {
            console.info('getSensorLists_SensorJsTest006 failed'+error);
            expect(false).assertTrue();
            done();
        });
    })
	
	/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0070
     * @tc.name: getSensorLists_SensorJsTest007
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it("getSensorLists_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            sensor.getSensorList(invild).then(data => {
                console.info("getSensorLists_SensorJsTest007 " + JSON.stringify(data));
                done();
            }), (error => {
                console.info(error);
                expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                expect(error.code).assertEqual(SERVICE_EXCEPTION_MSG);
                done();
            });
        } catch(error) {
            console.info(error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
	})
	
	/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0080
     * @tc.name: getSensorLists_SensorJsTest008
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it("getSensorLists_SensorJsTest008", 0, async function (done) {
        sensor.getSensorList(undefined).then((data) => {
            for (let i = 0; i < data.length; i++) {
                console.info("getSensorLists_SensorJsTest008 " + JSON.stringify(data[i]));
            }
            expect(true).assertTrue();
            done();
        }, (error) => {
            console.info('getSensorLists_SensorJsTest008 failed');
            expect(false).assertTrue();
            done();
        });
    })

	/**
     * @tc.number:SUB_SensorsSystem_GetSensorLists_JSTest_0090
     * @tc.name: getSensorLists_SensorJsTest009
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it("getSensorLists_SensorJsTest009", 0, async function (done) {
        sensor.getSensorList(null).then((data) => {
            for (let i = 0; i < data.length; i++) {
                console.info("getSensorLists_SensorJsTest009 " + JSON.stringify(data[i]));
            }
            expect(true).assertTrue();
            done();
        }, (error) => {
            console.info('getSensorLists_SensorJsTest009 failed');
            expect(false).assertTrue();
            done();
        });
    })	
})}
