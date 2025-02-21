/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import sensor from '@ohos.sensor'

export default function SystemParameterTest() {
describe('SystemParameterTest', function () {
    beforeAll(function () {
        console.info('beforeAll caled')
    })

    afterAll(function () {
        console.info('afterAll caled')
    })

    beforeEach(function () {
        console.info('beforeEach caled')
    })

    afterEach(function () {
        console.info('afterEach caled')
    })

    let testNullSensorId = -1;
    let errCode = 401
    let errMessage = 'The parameter invalid.'

   /**
   * @tc.number SUB_SENSORS_Sensor_JSTest_0010
   * @tc.name   testRegisterSensortest001
   * @tc.desc   test get sensor data by wrong sensor id.
   */
    it('testRegisterSensortest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('testRegisterSensortest001 start');
        function onSensorCallback(data) {
            console.info('testRegisterSensortest001 callback in');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.on(testNullSensorId, onSensorCallback);
        } catch (error) {
            console.info('testRegisterSensortest001 error: ' + error.code + ' ,msg: ' + error.message);
            expect(error.code).assertEqual(errCode)
            expect(error.message).assertEqual(errMessage)
            done();
        }
        console.info('testRegisterSensortest001 end');
    })
})}
