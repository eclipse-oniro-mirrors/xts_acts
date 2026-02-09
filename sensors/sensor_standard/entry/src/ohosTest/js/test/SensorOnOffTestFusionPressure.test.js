/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_65() {
describe("SensorJsTest_sensor_65", function () {

    const PARAMETER_ERROR_CODE = 401
    let sensorList = undefined
    let Available = false;
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof (data.fusionPressure)).assertEqual("number");
    }

    let isAvailable = async (data) => {
      if (sensorList != undefined) {
        const targetSensor = sensorList?.filter((sensors) => sensors.sensorId === data)
        hilog.info(0x0000, 'testTag', `isAvailable : ${targetSensor},length : ${targetSensor?.length}`);
        if (targetSensor?.length != 0) {
          Available = true
          hilog.info(0x0000, 'testTag', `Available : ${Available}`);
        } else {
          Available = false
          hilog.info(0x0000, 'testTag', `Available : ${Available}`);
        }
      } else {
        hilog.info(0x0000, 'testTag', `sensorList : ${sensorList}`);
      }
    }

    beforeAll(function (done) {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        try {
            sensor.getSensorList((err, data) => {
                hilog.info(0x0000, 'testTag',  `beforeAll Succeeded in getting GetSensorList err.code ${err?.code} ,err.message${err?.message}`);
                sensorList = data
                done();
            });
            hilog.info(0x0000, 'testTag', `beforeAll success ${sensorList}`);
        } catch (error) {
            hilog.info(0x0000, 'testTag', `beforeAll failed err.code ${error.code} ,err.message${error.message}`);
            done();
        }
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

    /**
     * @tc.name   newFusion_Pressure_SensorJsTest012
     * @tc.number SUB_SensorsSystem_Fusion_Pressure_JSTest_0120
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newFusion_Pressure_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newFusion_Pressure_SensorJsTest012--------');
        await isAvailable(sensor.SensorId.FUSION_PRESSURE);
        try {
            sensor.on(sensor.SensorId.FUSION_PRESSURE, callback);
            setTimeout(() => {
                expect(true).assertTrue();
                done();
            }, 500);
        } catch (error) {
            hilog.info(0x0000, 'testTag', `newFusion_Pressure_SensorJsTest012 failed error.code: ${error.code} , error.message: ${error.message}`);
            if (Available) {
                expect(false).assertTrue();
            } else {
                expect(error.code == PARAMETER_ERROR_CODE).assertTrue();
            }
            done();
        }
    })

    /**
     * @tc.name   newFusion_Pressure_SensorJsTest018
     * @tc.number SUB_SensorsSystem_Fusion_Pressure_JSTest_0180
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newFusion_Pressure_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newFusion_Pressure_SensorJsTest018--------');
        await isAvailable(sensor.SensorId.FUSION_PRESSURE);
        function onSensorCallback(data) {
            console.info('newFusion_Pressure_SensorJsTest018  on error');
            expect(false).assertTrue();
        }
        try {
            sensor.on(sensor.SensorId.FUSION_PRESSURE, onSensorCallback);
            console.info('-------------------newFusion_Pressure_SensorJsTest018 off in------------');
            sensor.off(sensor.SensorId.FUSION_PRESSURE);
            console.info('-------------------newFusion_Pressure_SensorJsTest018 off end-----------');
            expect(true).assertTrue();
            done();
        } catch (error) {
            hilog.info(0x0000, 'testTag', `newFusion_Pressure_SensorJsTest018 failed error.code: ${error.code} , error.message: ${error.message}`);
            if (Available) {
                expect(false).assertTrue();
            } else {
                expect(error.code == PARAMETER_ERROR_CODE).assertTrue();
            }
            done();
        }
    })
})
}
